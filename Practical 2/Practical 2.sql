-- Databricks notebook source

------1. SELECT Statement
--Q1 Display all columns for all transactions.
SELECT * 
FROM `workspace`.`default`.`retail_sales_dataset_2`;

--Q2 Display only the Transaction ID, Date, and Customer ID for all records.
SELECT `Transaction ID`,
        Date,
        `Customer ID`
FROM `workspace`.`default`.`retail_sales_dataset_2`;

-----2.SELECT DISTINCT Statement
--Q3 Display all the distinct product categories in the dataset.
SELECT `Product Category`
FROM `workspace`.`default`.`retail_sales_dataset_2`;

--Q4 Display all the distinct gender values in the dataset.
SELECT DISTINCT(Gender)
FROM `workspace`.`default`.`retail_sales_dataset_2`;

-----3.WHERE Clause
--Q5 Display all transactions where the Age is greater than 40.
SELECT *
FROM `workspace`.`default`.`retail_sales_dataset_2`
WHERE Age > 40;

--Q6 Display all transactions where the Price per Unit is between 100 and 500.
SELECT *
FROM `workspace`.`default`.`retail_sales_dataset_2`
WHERE `Price per Unit` BETWEEN 100 AND 500;

--Q7 Display all transactions where the Product Category is either 'Beauty' or 'Electronics'.
SELECT *
FROM `workspace`.`default`.`retail_sales_dataset_2`
WHERE `Product Category` =  'Beauty' OR `Product Category` = 'Electronics';

--Q8. Display all transactions where the Product Category is not 'Clothing'.
SELECT *
FROM `workspace`.`default`.`retail_sales_dataset_2`
WHERE `Product Category` !=  'Clothing';

--Q9 Display all transactions where the Quantity is greater than or equal to 3.
SELECT *
FROM `workspace`.`default`.`retail_sales_dataset_2`
WHERE Quantity >= 3;

-----4 Aggregate Functions
--Q10 Count the total number of transactions.
SELECT COUNT(`Transaction ID`) AS Total_Transactions
FROM `workspace`.`default`.`retail_sales_dataset_2`;

--Q11 Find the average Age of customers.
SELECT AVG(Age) AS Average_Age
FROM `workspace`.`default`.`retail_sales_dataset_2`;

--Q12 Find the total quantity of products sold.
SELECT SUM(Quantity) AS Total_Quantity
FROM `workspace`.`default`.`retail_sales_dataset_2`;

--Q13 Find the maximum Total Amount spent in a single transaction.
SELECT MAX(`Total Amount`) AS Max_Total_Amount
FROM `workspace`.`default`.`retail_sales_dataset_2`;

--Q14 Find the minimum Price per Unit in the dataset.
SELECT MIN(`Price per Unit`) AS Min_Price_per_Unit
FROM `workspace`.`default`.`retail_sales_dataset_2`;

-----5.GROUP BY Statement
--Q15. Find the number of transactions per Product Category. 
SELECT `Product Category`,
    COUNT(`Transaction ID`) AS Transaction_Count
FROM `workspace`.`default`.`retail_sales_dataset_2`
GROUP BY `Product Category`;

--Q16. Find the total revenue (Total Amount) per gender. Expected output: Gender, Total_Revenue
SELECT Gender,
    SUM(`Total Amount`) AS Total_Revenue
FROM `workspace`.`default`.`retail_sales_dataset_2`
GROUP BY Gender;

--Q17.Find the average Price per Unit per product category. 
SELECT `Product Category`,
    AVG(`Price per Unit`) AS Average_Price
FROM `workspace`.`default`.`retail_sales_dataset_2`
GROUP BY `Product Category`;

-----6.HAVING Clause
--Q18.Find the total revenue per product category where total revenue is greater than 10,000. 
SELECT `Product Category`,
    SUM(`Total Amount`) AS Total_Revenue
FROM `workspace`.`default`.`retail_sales_dataset_2`
GROUP BY `Product Category`
HAVING Total_Revenue > 10000;

--Q19. Find the average quantity per product category where the average is more than 2.
SELECT `Product Category`,
    AVG(Quantity) AS Average_Quantity
FROM `workspace`.`default`.`retail_sales_dataset_2`
GROUP BY `Product Category`
HAVING Average_Quantity > 2;

-----7. CASE Statement
--Q20. Display a column called Spending_Level that shows 'High' if Total Amount > 1000, otherwise 'Low'.
SELECT `Transaction ID`,
    `Total Amount`,

    CASE
      WHEN `Total Amount` > 1000 THEN 'High'
      ELSE 'Low'
      END AS Spending_Level
FROM `workspace`.`default`.`retail_sales_dataset_2`;

--Q21. Display a new column called Age_Group that labels customers as: 'Youth' if Age < 30, 'Adult' if Age is between 30 and 59, 'Senior' if Age >= 60.
SELECT `Customer ID`,
    Age,

    CASE
      WHEN Age < 30 THEN 'Youth'
      WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
      ELSE 'Senior'
      END AS Age_Group
FROM `workspace`.`default`.`retail_sales_dataset_2`;