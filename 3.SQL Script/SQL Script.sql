
-----Q1 WHERE Clause   Filter all transactions that occurred in the year 2023.

SELECT *
FROM `sales-493318.retail.sale`
WHERE DATE >= '2023-01-01'
  AND DATE< '2024-01-01';



----Q2 Filtering + Conditions Display all transactions where the Total Amount is more than the average Total Amount of the entire dataset.



SELECT *
FROM (
    SELECT *,
           AVG(`total amount`) OVER() AS avg_total
     FROM `sales-493318.retail.sale`
)
WHERE `total amount` > avg_total;

----Q3 Aggregate Functions  Calculate the total revenue (sum of Total Amount).

SELECT 
SUM(`Total Amount`) AS Total_revenue
FROM `sales-493318.retail.sale`;

----Q4 DISTINCT Display all distinct Product Categories in the dataset.
SELECT 
DISTINCT `Product Category` AS Product_Category
FROM `sales-493318.retail.sale`;

----Q5 GROUP BY For each Product Category, calculate the total quantity sold.

SELECT `Product Category`,
SUM(Quantity) AS Total_Quantity
FROM `sales-493318.retail.sale`
GROUP BY `Product Category`;

-----Q6 CASE Statement Create a column called Age_Group that classifies customers as:

SELECT `Customer ID`,
       Age,
  CASE     

WHEN Age<30 THEN 'Youth'
WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
WHEN Age>=60 THEN 'Senior'
END AS Age_Group

FROM `sales-493318.retail.sale`;

----Q7 Conditional Aggregation For each Gender, count how many high-value transactions occurred (where Total Amount > 500).

SELECT COUNT (DISTINCT `Transaction ID`) AS  High_Value_Transactions,
Gender
FROM `sales-493318.retail.sale`

WHERE `Total Amount`>500
GROUP BY Gender;

---Q8 HAVING Clause For each Product Category, show only those categories where the total revenue exceeds 5,000.

SELECT DISTINCT `Product Category`,
SUM(`Total Amount`) AS Total_revenue

FROM `sales-493318.retail.sale`
GROUP BY `Product Category`
HAVING SUM(`Total Amount`)>5000;


------Q9 Calculated Fields  Display a new column called Unit_Cost_Category that labels a transaction as:

SELECT `Transaction ID`,`Price per Unit`,

CASE
   WHEN `Price per Unit`<50 THEN 'Cheap'
      WHEN `Price per Unit`  BETWEEN  50 AND 200 THEN 'Moderate'
         WHEN `Price per Unit`>200 THEN 'Expensive'

        END AS Unit_Cost_Category

FROM `sales-493318.retail.sale`;


----Q10 Combining WHERE + CASE  Display all transactions from customers aged 40 or older and add a column Spending_Level showing:

 SELECT `Customer ID`, Age, `Total Amount`,

CASE 

 WHEN `Total Amount` > 1000 THEN 'High'
 ELSE 'Low'

 END AS Spending_Level

 FROM `sales-493318.retail.sale`

 WHERE Age>40;





