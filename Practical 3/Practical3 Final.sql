SELECT * FROM `bigquery-practical-494621.bigquerypractical.retailpractical3` LIMIT 1000;


--Q1
SELECT * FROM `bigquery-practical-494621.bigquerypractical.retailpractical3`  WHERE EXTRACT(YEAR FROM Date) = 2023 LIMIT 1000;

--Q2
SELECT * FROM `bigquery-practical-494621.bigquerypractical.retailpractical3`  WHERE `Total Amount` > (select AVG(`Total Amount`) from `bigquery-practical-494621.bigquerypractical.retailpractical3`);

--Q3
SELECT SUM(`Total Amount`) AS total_revenue FROM `bigquery-practical-494621.bigquerypractical.retailpractical3`;

--Q4
SELECT DISTINCT(`Product Category`) FROM `bigquery-practical-494621.bigquerypractical.retailpractical3`;

--Q5
SELECT `Product Category`,SUM(Quantity) AS total_quantity  FROM `bigquery-practical-494621.bigquerypractical.retailpractical3` GROUP BY `Product Category`;

--Q6
SELECT `Transaction ID`,
    Age,
  CASE
    WHEN Age < 30 THEN 'Youth'
    WHEN Age BETWEEN 30 AND 59 THEN 'Youth'
    ELSE 'Senior'
  END AS Age_Group
FROM `bigquery-practical-494621.bigquerypractical.retailpractical3`
LIMIT 1000;

--Q7
SELECT Gender,
COUNT(`Total Amount` > 500) As high_value_transactions
FROM `bigquery-practical-494621.bigquerypractical.retailpractical3`
GROUP BY Gender;

--Q8
SELECT `Product Category`,
SUM(`Total Amount`) AS total_revenue
FROM `bigquery-practical-494621.bigquerypractical.retailpractical3`
GROUP BY `Product Category`
HAVING total_revenue > 5000;

--Q9
SELECT `Transaction ID` AS transaction_ID,
      `Price per Unit` AS price_per_unit,
 CASE
    WHEN `Price per Unit` < 50 THEN 'Cheap'
    WHEN `Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
    ELSE 'Expensive'
  END AS unit_cost_category
FROM `bigquery-practical-494621.bigquerypractical.retailpractical3`
LIMIT 1000;

---Q10
SELECT `Customer ID` AS customer_ID,
        Age,
      `Total Amount` AS total_amount,
 CASE
    WHEN `Total Amount` > 1000 THEN 'High'
    ELSE 'Low'
  END AS spending_level
FROM `bigquery-practical-494621.bigquerypractical.retailpractical3`
WHERE Age >40
LIMIT 1000;











