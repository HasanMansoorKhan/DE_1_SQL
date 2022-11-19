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

## EER DIAGRAM using Reverse Engineering 

<img width="898" alt="ER_diagram" src="https://user-images.githubusercontent.com/113629683/202856153-81755af8-6385-4f6a-936a-7eecba08f898.png">

# 2. ANALYTICS PLAN:

My analytical plan includes to use the four tables extracted using the operational layer. I will add an analytical layer where I will generate a new table for sales category information. This will be a denormalized structure made using a stored produre. Once the procedure is called a new table will be returned which includes important sales information for analysis and only columns that are pertinent to the scope of the analysis will be included. 

<img width="846" alt="Analytical_Plan" src="https://user-images.githubusercontent.com/113629683/202856171-d551bbb8-d361-4ca5-99fa-65d609b5bf9b.png">


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

<img width="1680" alt="Star_Schema png " src="https://user-images.githubusercontent.com/113629683/202856224-a4797553-53a2-40e2-a96b-417c2507d79c.png">

The analytical layer includes new columns which are instrumental for analysis and data marts. Firstly, a new revenue column is created which shows the amount in usd that each order, pizza & category generates. Secondly, a new columns counts the number of ingredients used in each pizza. As a result of the stored procedure, the new table sales category allows for insights into categorywise revenue and sales analysis. It allows us to answer specific questions regarding the pizza sales. 

<img width="1109" alt="Sales_category" src="https://user-images.githubusercontent.com/113629683/202856184-866002a6-e074-4f78-9820-63e4990a55b4.png">

# 4. DATA MARTS

Data marts or views are created using SQL code for answering the specific questions of the analytical plan. The questions are solved using SQL functions taught in class such as aggregations, joins, conditions and more.

## DATA MART 1. WHICH PIZZA MADE THE MOST IN REVENUE?  

Answer: Thai Chicken Pizza made the most revenue with USD 43,434 in the given year 

<img width="493" alt="Screenshot 2022-11-19 at 19 31 25" src="https://user-images.githubusercontent.com/113629683/202855903-d2e41c3a-1074-4e11-b4ab-cda51fecb43c.png">



## DATA MART 2. WHAT IS THE TOP PIZZA CATEGORY?  

Answer: Classic category is the top category in quantity and revenue. 

<img width="464" alt="Screenshot 2022-11-19 at 19 32 15" src="https://user-images.githubusercontent.com/113629683/202855940-98c43f89-d1ab-4a82-9431-15c985abd8aa.png">




## DATA MART 3. WHAT IS THE MOST COMMON PIZZA QUANTITY ORDERED  

Answer: The maximum number of orders received were for 1 pizza

<img width="464" alt="Screenshot 2022-11-19 at 19 33 48" src="https://user-images.githubusercontent.com/113629683/202856030-ea82b95a-2763-46b7-93b8-7e871f168c7e.png">


## DATA MART 4. PIZZAS BY NUMBER OF INGREDIENTS.

Answer: The pizzas with most ingredients were pizzas that needed 8 ingredients & the least number of ingredients was 2 

<img width="963" alt="Screenshot 2022-11-19 at 19 34 35" src="https://user-images.githubusercontent.com/113629683/202856069-3e079f32-ccbc-48b0-9ba4-12d4a3702784.png">



## DATA MART 5. WHICH PIZZAS WERE POPULAR AND WHICH PIZZAS WERE UNPOPULAR? 

Answer: Pizzas with sales of less than 1000 in quantity are categorised as unpopular while sales greater than 1000 are categorised as popular 

<img width="554" alt="Screenshot 2022-11-19 at 19 35 09" src="https://user-images.githubusercontent.com/113629683/202856100-6b227417-30ac-487f-9716-a1039146f98e.png">


# 4. CONLCUSION

At the completion of this term project, I found that data engineering using SQL is instrumental in business analytics. The project enabled me to apply the various SQL funtions taught in class. The process I followed during this term 1 project was to first find a relational dataset which is suitable for further analysis. I then uploaded the dataset into MYSQL workbench and formulated an analytics plan. Then after using the SQL funtions to analyse, I answered the initial questions of analytics plan by creating 5 specific data marts. These provided answers and detailed insights into the analytical questions. 

I found the term 1 project applicative where the learned class materials were used and analytical queries solved. 
