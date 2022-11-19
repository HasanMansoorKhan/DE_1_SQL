# DE_1_SQL

This repository is for Data Engineering 1 using SQL. It contains my term 1 project. For the purpose of my term 1 project, I chose sales data for a fictious Pizza place on the maven analytics data playground. My repository contains files including the operational layer, analytics plan, analytical layer using ETL pipeline, data marts/views using my analytical layer. The repository also includes an EER diagram screenshot & EER mwb file showing the relational dataset. 

# 1. OPERATIONAL LAYER:

## About the Dataset
The dateset I chose for my term 1 project is about sales data of a fictious pizza place. The following is the link to access the dataset: https://www.mavenanalytics.io/data-playground

My motivation for chosing the pizza sales dataset was the interesting role of sales in business analytics. The dataset comprises of 4 csv files each 
representing a table. 

## The four tables include:

1. Orders table which contains the order id and data and time.
2. Orders details table which contains order id, order details id, quantity and pizza id.
3. Pizzas table includes piiza id, pizza type id, size of the pizza and its price.
4. Pizza types table includes piiza type id, pizza name, category & its ingredients.

The relational dataset is linked via unique IDs in each table, as shown in the EER diagram. For. the project I creared a schema: pizza_sales. Then I created 4 emtpty tables using SQL code. Special attention was paid to data type of each column, its Primary Key & whether it can be a Null value or not. I then procceeded with populating the data tables using SQL code for uploading CSVs into SQL. databse. Lastly, I added Foreign Key Constraints for the relevant tables. After adding the foreign key constraints, I used reverse engineering to form an EER diagram. 

# 2. ANALYTICS PLAN:

My analytical plan includes to use the four tables extracted using the operational layer. I will add an analytical layer where I will generate a new table for sales category information. This will be a denormalized structure made using a stored produre. Once the procedure is called a new table will be returned which includes important sales information for analysis and only columns that are pertinent to the scope of the analysis will be included. 

## Important analytics:
1. WHICH PIZZA MADE THE MOST IN REVENUE?  
2. WHAT IS THE TOP PIZZA CATEGORY?  
3. WHAT IS THE MOST COMMON PIZZA QUANTITY ORDERED  
4. PIZZAS BY NUMBER OF INGREDIENTS.
5. WHICH PIZZAS WERE POPULAR AND WHICH PIZZAS WERE UNPOPULAR? 

# 3. ANALYTICAL LAYER:
After the operational layer & analytical plan is completed, the basis of my analysis has been established. I now proceed to use SQL code to create a stored procedure which create sales category. This will return a table including name, category, revenue & number of ingredients. The new table is made using the followung joins: 

1. pizza table and order Details_table using pizza_id
2. pizza table and pizza_types table using pizza_type_id

Number of records in operational dataset is 48,620 & the new table also includes the same number. Hence the analytical layer is funtional. 

The analytical layer includes new columns which are instrumental for analysis and data marts. Firstly, a new revenue column is created which shows the amount in usd that each order, pizza & category generates. Secondly, a new columns counts the number of ingredients used in each pizza. As a result of the stored procedure, the new table sales category allows for insights into categorywise revenue and sales analysis. It allows us to answer specific questions regarding the pizza sales. 


# 4. DATA MARTS

Data marts or views are created using SQL code for answering the specific questions of the analytical plan. The questions are solved using SQL functions taught in class such as aggregations, joins, conditions and more.

## DATA MART 1. WHICH PIZZA MADE THE MOST IN REVENUE?  

Answer: Thai Chicken Pizza made the most revenue with USD 43,434 in the given year 




## DATA MART 2. WHAT IS THE TOP PIZZA CATEGORY?  

Answer: Classic category is the top category in quantity and revenue. 





## DATA MART 3. WHAT IS THE MOST COMMON PIZZA QUANTITY ORDERED  

The maximum number of orders received were for 1 pizza

## DATA MART 4. PIZZAS BY NUMBER OF INGREDIENTS.

The pizzas with most ingredients were pizzas that needed 8 ingredients & the least number of ingredients was 2 


## DATA MART 5. WHICH PIZZAS WERE POPULAR AND WHICH PIZZAS WERE UNPOPULAR? 

Pizzas with sales of less than 1000 in quantity are categorised as unpopular while sales greater than 1000 are categorised as popular 

# 4. CONLCUSION

