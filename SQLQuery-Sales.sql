USE [Project-Portfolio];
SELECT name FROM sys.tables; -- Lists tables in the database

Select * From Sales

SELECT TOP 10 * FROM Sales;


Select Customer_Age, SUM(Revenue) AS TotalRevenue From Sales
Group by Customer_Age

SELECT 
    MIN(Customer_Age) AS MinAge,
    MAX(Customer_Age) AS MaxAge
FROM Sales;

--SELECT 
    --Date, 
    --Revenue, 
    --CASE 
        --WHEN Customer_Age BETWEEN 18 AND 25 THEN '17-25'
        --WHEN Customer_Age BETWEEN 26 AND 35 THEN '26-35'
      --  ELSE '36+' 
  --  END AS Age_Group
--FROM Sales;

Select Age_Group, SUM(Revenue) AS TotalRevenue From Sales
Group by Age_Group

Select Age_Group, SUM(Profit) AS TotalProfit From Sales
Group by Age_Group

--The name of columns:

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Sales'

-- Summarizing Sales Data by Country, Product, and Gender
SELECT 
    Country,
    Product_Category,
    Product,
    Customer_Gender,
    Age_Group,
    SUM(Order_Quantity) AS Total_Orders,
    ROUND(SUM(Cost), 2) AS Total_Cost,
    ROUND(SUM(Revenue), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Unit_Cost), 2) AS Avg_Unit_Cost,
    ROUND(AVG(Unit_Price), 2) AS Avg_Unit_Price,
    ROUND((SUM(Profit) / NULLIF(SUM(Cost), 0)) * 100, 2) AS Profit_Margin_Percentage --This calculated field shows profitability as a percentage.
FROM 
    Sales
WHERE 
    Revenue > 0 -- Ensures valid transactions
GROUP BY 
    Country, Product_Category, Product, Customer_Gender, Age_Group
ORDER BY 
    Total_Revenue DESC;


-- Monthly Revenue and Profit Trend
SELECT 
    Year,
    Month,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit
FROM 
    Sales
GROUP BY 
    Year, Month
ORDER BY 
    Year, Month;



-- Summarize the distribution of customers by gender, age group, and country.

SELECT 
    Country,
    Customer_Gender,
    Age_Group,
    COUNT(*) AS Customer_Count,
    AVG(Customer_Age) AS Avg_Customer_Age
FROM 
    Sales
GROUP BY 
    Country, Customer_Gender, Age_Group
ORDER BY 
    Country, Customer_Gender, Age_Group;



-- Best selling Products by Country
-- Top 5 Products by Country Based on Total Revenue
SELECT 
    Country,
    Product,
    SUM(Order_Quantity) AS Total_Orders,
    SUM(Revenue) AS Total_Revenue
FROM 
    Sales
GROUP BY 
    Country, Product
ORDER BY 
    Total_Revenue DESC


-- The top 10 products with the highest revenue.
SELECT 
    Product,
    Product_Category,
    SUM(Revenue) AS Total_Revenue,
    SUM(Order_Quantity) AS Total_Orders,
    SUM(Profit) AS Total_Profit
FROM 
    Sales
GROUP BY 
    Product, Product_Category
ORDER BY 
    Total_Revenue DESC


-- Profit Analysis by Sub-Category
SELECT 
    Product_Category,
    Sub_Category,
    SUM(Profit) AS Total_Profit
FROM 
    YourTableName
GROUP BY 
    Product_Category, Sub_Category
ORDER BY 
    Product_Category, Total_Profit DESC;



