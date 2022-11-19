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


# 3. ANALYTICAL LAYER:


# 4. DATA MARTS

# 4. CONLCUSION

