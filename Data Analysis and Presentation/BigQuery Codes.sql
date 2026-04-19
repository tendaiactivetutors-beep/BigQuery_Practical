Q1 WHERE Clause Filter all transactions that occurred in the year 2023.

SELECT
    `Big-Query Practical`.`Transaction ID`,
    `Big-Query Practical`.`Date`,
    `Big-Query Practical`.`Customer ID`,
    `Big-Query Practical`.`Gender`,
    `Big-Query Practical`.`Age`,
    `Big-Query Practical`.`Product Category`,
    `Big-Query Practical`.`Quantity`,
    `Big-Query Practical`.`Price per Unit`,
    `Big-Query Practical`.`Total Amount`
  FROM
    `tidal-timer-493319-f9.19_Oct87.Big-Query Practical` AS `Big-Query Practical`
  WHERE
    EXTRACT(YEAR FROM `Big-Query Practical`.`Date`) = 2023
  ORDER BY
    `Big-Query Practical`.`Date` ASC;


Q2 Filtering + Conditions Display all transactions where the Total Amount is more than the average Total Amount of the entire dataset.

SELECT
    transactions.`Transaction ID`,
    transactions.`Date`,
    transactions.`Customer ID`,
    transactions.`Gender`,
    transactions.`Age`,
    transactions.`Product Category`,
    transactions.`Quantity`,
    transactions.`Price per Unit`,
    transactions.`Total Amount`
  FROM
    `tidal-timer-493319-f9.19_Oct87.Big-Query Practical` AS transactions
  WHERE
    transactions.`Total Amount` > (
      SELECT
        AVG(`Total Amount`)
      FROM
        `tidal-timer-493319-f9.19_Oct87.Big-Query Practical`
    )
ORDER BY
  transactions.`Total Amount` DESC;

Q3 Aggregate Functions Calculate the total revenue (sum of Total Amount).

SELECT
    SUM(transactions.`Total Amount`) AS total_revenue
  FROM
    `tidal-timer-493319-f9.19_Oct87.Big-Query Practical` AS transactions;


Q4 DISTINCT Display all distinct Product Categories in the dataset.

SELECT DISTINCT
    transactions.`Product Category`
FROM
    `tidal-timer-493319-f9.19_Oct87.Big-Query Practical` AS transactions;


Q5 GROUP BY For each Product Category, calculate the total quantity sold.

SELECT
    transactions.`Product Category` AS Product_Category,
    SUM(transactions.`Quantity`) AS Total_Quantity
  FROM
    `tidal-timer-493319-f9.19_Oct87.Big-Query Practical` AS transactions
  GROUP BY
    Product_Category;


Q6 CASE Statement Create a column called Age_Group that classifies customers as: – 'Youth' (<30) – 'Adult' (30–59) – 'Senior' (60+)

SELECT DISTINCT
    transactions.`Customer ID` AS Customer_ID,
    transactions.`Age`,
    CASE
      WHEN transactions.`Age` < 30 THEN 'Youth'
      WHEN transactions.`Age` BETWEEN 30 AND 59 THEN 'Adult'
      WHEN transactions.`Age` >= 60 THEN 'Senior'
    END AS Age_Group
  FROM
    `tidal-timer-493319-f9.19_Oct87.Big-Query Practical` AS transactions
  ORDER BY
    transactions.`Age` ASC;


Q7 Conditional Aggregation For each Gender, count how many high-value transactions occurred (where Total Amount > 500).

SELECT
    `Big-Query Practical`.`Gender` AS Gender,
    COUNT(*) AS High_Value_Transactions
  FROM
    `tidal-timer-493319-f9.19_Oct87.Big-Query Practical` AS `Big-Query Practical`
  WHERE
    `Big-Query Practical`.`Total Amount` > 500
  GROUP BY Gender;


Q8 HAVING Clause For each Product Category, show only those categories where the total revenue exceeds 5,000.

SELECT
    `Big-Query Practical`.`Product Category` AS Product_Category,
    SUM(`Big-Query Practical`.`Total Amount`) AS Total_Revenue
  FROM
    `tidal-timer-493319-f9.19_Oct87.Big-Query Practical` AS `Big-Query Practical`
  GROUP BY
    Product_Category
  HAVING
    Total_Revenue > 5000;


Q9 Calculated Fields Display a new column called Unit_Cost_Category that labels a transaction as: – 'Cheap' if Price per Unit < 50 – 'Moderate' if Price per Unit between 50 and 200 – 'Expensive' if Price per Unit > 200

SELECT
    t.`Transaction ID`,
    t.`Price per Unit`,
    CASE
        WHEN t.`Price per Unit` < 50 THEN 'Cheap'
        WHEN t.`Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
        WHEN t.`Price per Unit` > 200 THEN 'Expensive'
    END AS Unit_Cost_Category
FROM
    `tidal-timer-493319-f9.19_Oct87.Big-Query Practical` AS t;


Q10 Combining WHERE + CASE Display all transactions from customers aged 40 or older and add a column Spending_Level showing: – 'High' if Total Amount > 1000 – 'Low' otherwise

SELECT
    t.`Customer ID`,
    t.`Age`,
    t.`Total Amount`,
    CASE
        WHEN t.`Total Amount` > 1000 THEN 'High'
        ELSE 'Low'
    END AS Spending_Level
FROM
    `tidal-timer-493319-f9.19_Oct87.Big-Query Practical` AS t
WHERE
    t.`Age` >= 40;
