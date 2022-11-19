
-- --------------------------------------------------------------------------------------------------------------------
-- 												DATA MARTS & VIEWS
-- --------------------------------------------------------------------------------------------------------------------

# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
#  DATA MARTS & VIEWS OVERVIEW                                           #
#  What the code does:                                                   #
#        1. Creating data marts/views from the new table created in      #
#           the analytical layer                                         #
#        2. Calling the 5 views                                          #                         
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #



SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


USE pizza_sales; 


# ---------------------------------------------------------------------- #
#  -- DATA MART 1
#  -- WHICH PIZZA MADE THE MOST IN REVENUE?                              #
# ---------------------------------------------------------------------- #

DROP VIEW IF EXISTS total_sales_quantity_revenue;
CREATE VIEW `total_sales_quantity_revenue` AS
SELECT 
name,
category,
SUM(quantity) AS Total_quantity,
ROUND(SUM(Revenue), 0 ) AS Total_revenue_USD
FROM sales_category
GROUP by name
order by Total_revenue_USD DESC;

-- CALL THE VIEW

SELECT * FROM pizza_sales.total_sales_quantity_revenue;

-- Answer: Thai Chicken Pizza made the most revenue with USD 43,434 in the given year 
 
# ---------------------------------------------------------------------- #
#  -- DATA MART 2
#  -- WHAT IS THE TOP PIZZA CATEGORY?                                    #
# ---------------------------------------------------------------------- #


DROP VIEW IF EXISTS top_category;
CREATE VIEW `top_category` AS
SELECT 
category,
SUM(quantity) AS Total_quantity,
ROUND(SUM(Revenue), 0 ) AS Total_revenue_USD
FROM sales_category
GROUP by category
order by Total_revenue_USD DESC;


-- CALL THE VIEW

SELECT * FROM pizza_sales.top_category;

 -- Answer: Classic category is the top category in quantity and revenue. 
 
# ---------------------------------------------------------------------- #
#  -- DATA MART 3
#  -- WHAT IS THE MOST COMMON PIZZA QUANTITY ORDERED                     #
# ---------------------------------------------------------------------- #


DROP VIEW IF EXISTS orders_by_quantity;
CREATE VIEW `orders_by_quantity` AS
SELECT quantity, count(*)
FROM sales_category 
GROUP by quantity
ORDER BY count(*) desc;


-- CALL THE VIEW

SELECT * FROM pizza_sales.orders_by_quantity;

-- The maximum number of orders received were for 1 pizza


# ---------------------------------------------------------------------- #
#  -- DATA MART 4
#  -- PIZZAS BY NUMBER OF INGREDIENTS.                                   #
# ---------------------------------------------------------------------- #


DROP VIEW IF EXISTS ingredients_in_category;
CREATE VIEW `ingredients_in_category` AS
SELECT 
name,
category,
ingredients,
number_of_ingredients
FROM sales_category
GROUP by name
order by number_of_ingredients DESC;

-- CALL THE VIEW

SELECT * FROM pizza_sales.ingredients_in_category;

-- The pizzas with most ingredients were pizzas that needed 8 ingredients & the least number of ingredients was 2 



# ---------------------------------------------------------------------- #
#  -- DATA MART 5
#  -- WHICH PIZZAS WERE POPULAR AND WHICH PIZZAS WERE UNPOPULAR?         #
# ---------------------------------------------------------------------- #

DROP VIEW IF EXISTS popular_pizza;

CREATE VIEW `popular_pizza` AS
SELECT  
ANY_VALUE(name)                AS pizza_name,
SUM(Quantity)                   AS TotalQuantity, 
ROUND(SUM(Revenue), 0)                    AS TotalRevenue,
CASE
            WHEN SUM(Quantity) <= 1000 THEN 'Unpopular'
            ELSE 'Popular'
        END AS PizzaPopularity
FROM sales_category
GROUP BY name
ORDER BY SUM(Quantity) DESC;

-- CALL THE VIEW

SELECT * FROM pizza_sales.popular_pizza;


-- Answer: Pizzas with sales of less than 1000 in quantity are categorised as unpopular while sales greater than 1000 are categorised as popular 