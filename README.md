##. BigQuery_Practical
##. Retail Sales Analysis with Google BigQuery
##. Project Overview
##This project contains a series of SQL queries developed as part of a practical exercise to analyze a Retail Sales Dataset using Google BigQuery
. The goal of the exercise was to demonstrate proficiency in core SQL concepts including data filtering, aggregation, conditional logic, and advanced grouping techniques
.
##.Dataset Description
The analysis is performed on a Retail Sales Dataset which includes transaction records with the following key attributes
:
##.Transaction Metadata: Transaction IDs, Dates, and Total Amounts.
. Customer Demographics: Customer IDs, Age, and Gender.
. Product Information: Product Categories and Price per Unit.
##. Analytical Tasks & SQL Techniques
. The project addresses ten specific business questions using various SQL clauses and functions:
1. Temporal Filtering: Utilizing the WHERE clause to isolate transactions from the year 2023
.
2. Comparative Analysis: Filtering transactions where the Total Amount exceeds the dataset average
.
3. Revenue Aggregation: Calculating the total revenue of the entire dataset using the SUM function
.
4. Unique Classification: Identifying all distinct product categories
.
5. Volume Analysis: Using GROUP BY to calculate the total quantity sold per product category
.
6. Demographic Segmentation: Implementing CASE statements to classify customers into age groups: Youth (<30), Adult (30–59), and Senior (60+)
.
7. Conditional Count: Counting high-value transactions (>500) segmented by gender
.
8. Threshold Analysis: Using the HAVING clause to filter product categories with revenue exceeding 5,000
.
9. Product Categorization: Creating calculated fields to label products as Cheap, Moderate, or Expensive based on unit price
.
10. Targeted Behavioral Analysis: Combining WHERE and CASE logic to analyze the spending levels of customers aged 40 and older
.
##. Tools Used
Google BigQuery: For data warehousing and executing SQL queries
.
. SQL: Primary language for data extraction and transformation.
##. How to Use This Repository
. Each query in the repository corresponds to the questions (Q1–Q10) outlined in the BrightLearn Practical Exercise
. You can run these queries directly in the BigQuery console on the relevant retail sales table.

## GitHub does not handle PDFs particularly well—**it mostly just accommodates them. Please note when you try to view it and it gives you an error, the file isn’t corrupted; it’s likely using certain fonts or characters that GitHub can’t properly display.**

## Note:If you want to view the PDF file and got an error, you will need to download it first.
