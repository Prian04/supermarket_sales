Create database supermarket_sales;
use supermarket_sales;

Select * from sales;

-- Total Sales
Select format(sum(Total),3) As Total_sales from sales;

-- Total Profit
Select round(sum(Total - cogs),3) As Total_profit from sales;

-- Total Quantity
Select sum(Quantity) from sales;

-- Total Payment
Select count(payment) from sales;

-- Total Tax %
Select round(sum(tax_5),3) from sales;

-- Total Sales By Gender Wise
Select gender, round(sum(Total),2) As Total_sales from sales group by gender order by Total_sales desc;

-- Total Sales By City
Select city, round(sum(Total),3) AS Total_sales from sales group by city order by Total_sales desc;

-- Total Sales By Branch
Select Branch, round(sum(Total),3) As Total_sales from sales group by branch order by Total_sales desc;

-- Total Sales By Product
Select Product_line, round(sum(Total),2) As Total_sales from sales group by Product_line order by Total_sales desc;

-- Total Sales By Profit From Particular City
Select City, round(sum(Total - cogs),2) As Total_profit from sales group by City;

-- Total Sales By Year
Select YEAR(Date) As Years,  round(sum(Total),2) As Total_sales from sales group by YEAR(Date) order by Total_sales;

SELECT YEAR(STR_TO_DATE(Date, '%m/%d/%Y')) AS Years,  round(sum(Total),2) AS Total_sales FROM sales  GROUP BY YEAR(STR_TO_DATE(Date, '%m/%d/%Y')) ORDER BY Total_sales;

-- Total Sales By Month
SELECT MONTH(STR_TO_DATE(Date, '%m/%d/%Y')) AS Month, round(sum(Total),2) AS Total_sales FROM sales  GROUP BY MONTH(STR_TO_DATE(Date, '%m/%d/%Y')) ORDER BY MONTH(STR_TO_DATE(Date, '%m/%d/%Y'));

SELECT  MONTHNAME(STR_TO_DATE(Date, '%m/%d/%Y')) AS Month_Name, round(sum(Total),2) AS Total_sales FROM sales  GROUP BY MONTHNAME(STR_TO_DATE(Date, '%m/%d/%Y')) ORDER BY MONTHNAME(STR_TO_DATE(Date, '%m/%d/%Y')) ASC;

SELECT 
    Month_Number,
    CASE 
        WHEN Month_Number = 1 THEN 'January'
        WHEN Month_Number = 2 THEN 'February'
        WHEN Month_Number = 3 THEN 'March'
        WHEN Month_Number = 4 THEN 'April'
        WHEN Month_Number = 5 THEN 'May'
        WHEN Month_Number = 6 THEN 'June'
        WHEN Month_Number = 7 THEN 'July'
        WHEN Month_Number = 8 THEN 'August'
        WHEN Month_Number = 9 THEN 'September'
        WHEN Month_Number = 10 THEN 'October'
        WHEN Month_Number = 11 THEN 'November'
        WHEN Month_Number = 12 THEN 'December'
    END AS Month_Name,
    Total_sales
FROM (
    SELECT 
        MONTH(STR_TO_DATE(Date, '%m/%d/%Y')) AS Month_Number,
        ROUND(SUM(Total), 2) AS Total_sales 
    FROM 
        sales  
    GROUP BY 
        MONTH(STR_TO_DATE(Date, '%m/%d/%Y')) 
) AS MonthlySales
ORDER BY 
    Month_Number;
    
SELECT 
    MONTH(
        CASE 
            WHEN INSTR(Date, '-') > 0 THEN STR_TO_DATE(Date, '%m-%d-%Y')
            WHEN INSTR(Date, '/') > 0 THEN STR_TO_DATE(Date, '%m/%d/%Y')
        END
    ) AS Month,
    ROUND(SUM(Total), 2) AS Total_sales 
FROM 
    sales  
GROUP BY 
    MONTH(
        CASE 
            WHEN INSTR(Date, '-') > 0 THEN STR_TO_DATE(Date, '%m-%d-%Y')
            WHEN INSTR(Date, '/') > 0 THEN STR_TO_DATE(Date, '%m/%d/%Y')
        END
    ) 
ORDER BY 
    MONTH(
        CASE 
            WHEN INSTR(Date, '-') > 0 THEN STR_TO_DATE(Date, '%m-%d-%Y')
            WHEN INSTR(Date, '/') > 0 THEN STR_TO_DATE(Date, '%m/%d/%Y')
        END
    );
-- Total Sales By Quarter
SELECT Quarter(STR_TO_DATE(Date, '%m/%d/%Y')) AS Quarter, round(sum(Total),2) AS Total_sales FROM sales  GROUP BY Quarter(STR_TO_DATE(Date, '%m/%d/%Y')) ORDER BY Quarter(STR_TO_DATE(Date, '%m/%d/%Y'));

SELECT Quarter(STR_TO_DATE(Date, '%m/%d/%Y')) AS Qu, round(sum(Total),2) AS Total_sales FROM sales  GROUP BY Quarter(STR_TO_DATE(Date, '%m/%d/%Y')) ORDER BY Quarter(STR_TO_DATE(Date, '%m/%d/%Y'));


Select * from sales;
Alter Table sales Rename COLUMN `Product line` TO product_line;
