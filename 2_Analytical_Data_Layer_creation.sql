-- --------------------------------------------------------------------------------------------------------------------
-- 												ANALYTICAL LAYER
-- --------------------------------------------------------------------------------------------------------------------

# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
#  ANALYTICAL DATA LAYER OVERVIEW                                        #
#  What the code does:                                                   #
#        1. Creates a  denormalized structure from the operational       #
#           tables to extract useful information                         #
#        2. Creates a new table using a stored procedure                 #                         
#        3. The new table is made using the followung joins:             #
#              1. pizza table and order Details_table using pizza_id     #
#              2. pizza table and pizza_types table using pizza_type_id  #
#        4. Generate new columns for revenue and number of ingredients   #
#        5. Call the stored procedure                                    #



USE pizza_sales; 

DROP PROCEDURE IF EXISTS create_sales_category;

DELIMITER //

CREATE PROCEDURE create_sales_category()
BEGIN

	DROP TABLE IF EXISTS sales_category;
    CREATE TABLE sales_category AS
SELECT  
		pizza_types.pizza_type_id, 
        pizza_types.category,
        pizza_types.name,
        pizza_types.ingredients,
		LENGTH(ingredients) - LENGTH(REPLACE(ingredients, ', ', ' ')) + 1 AS number_of_ingredients,
        order_details.quantity,
        pizzas.price,
        pizzas.size,
		ROUND(pizzas.price*order_details.quantity, 2)    AS Revenue 
        
FROM pizzas
		INNER JOIN order_details
		ON pizzas.pizza_id = order_details.pizza_id
		INNER JOIN pizza_types 
		ON pizzas.pizza_type_id = pizza_types.pizza_type_id;
		
        
       


END //
DELIMITER ;


-- Calling the stored procedure 


call pizza_sales.create_sales_category();


-- Checking the new table
SELECT * FROM sales_category; 


-- Number of records in operational dataset: 48,620
-- Check number of records in new table created in analytical layer

SELECT count(*) FROM sales_category;

-- 48,620 orders in the operational & analytical dataset. Hence the analytical layer is funtional