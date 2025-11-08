/*Which top 10 products generated the highest total sales?*/
SELECT TOP 10 P.PRODUCT_NAME, SUM(F.SALES) AS TOTAL_SALES
FROM dbo.factSales F
JOIN dbo.productDim P ON F.PRODUCT_KEY = P.PRODUCT_ID
GROUP BY P.PRODUCT_NAME
ORDER BY TOTAL_SALES DESC;
/*Which categories contribute most to total profit?*/
SELECT C.CATEGORY, SUM(F.PROFIT) AS TOTAL_PROFIT
FROM dbo.factSales F
JOIN dbo.productDim P ON F.PRODUCT_KEY = P.PRODUCT_ID
JOIN dbo.subCategoryDim S ON P.SUBCATEGORY_ID = S.SUBCATEGORY_ID
JOIN dbo.categoryDim C ON S.CATEGORY_ID = C.CATEGORY_ID
GROUP BY C.CATEGORY
ORDER BY TOTAL_PROFIT DESC;
/* What is the average profit margin (%) by category and subcategory?*/
SELECT C.CATEGORY, S.SUB_CATEGORY,
SUM(F.PROFIT)*100.0 / SUM(F.SALES) AS PROFIT_MARGIN_PERCENT
FROM dbo.factSales F
JOIN dbo.productDim P ON F.PRODUCT_KEY = P.PRODUCT_ID
JOIN dbo.subCategoryDim S ON P.SUBCATEGORY_ID = S.SUBCATEGORY_ID
JOIN dbo.categoryDim C ON S.CATEGORY_ID = C.CATEGORY_ID
GROUP BY C.CATEGORY, S.SUB_CATEGORY
ORDER BY PROFIT_MARGIN_PERCENT DESC;
/* Which products have low sales but high profit, indicating potential for marketing focus?*/
SELECT P.PRODUCT_NAME,
SUM(F.SALES) AS TOTAL_SALES,
SUM(F.PROFIT) AS TOTAL_PROFIT
FROM dbo.factSales F
JOIN dbo.productDim P ON F.PRODUCT_KEY = P.PRODUCT_ID
GROUP BY P.PRODUCT_NAME
HAVING SUM(F.SALES) < (SELECT AVG(SALES) FROM dbo.factSales)
AND SUM(F.PROFIT) > (SELECT AVG(PROFIT) FROM dbo.factSales)
ORDER BY TOTAL_PROFIT DESC;
/*What is the sales-to-profit ratio for each product category?*/
SELECT C.CATEGORY,
SUM(F.SALES)*1.0 / NULLIF(SUM(F.PROFIT),0) AS SALES_PROFIT_RATIO
FROM dbo.factSales F
JOIN dbo.productDim P ON F.PRODUCT_KEY = P.PRODUCT_ID
JOIN dbo.subCategoryDim S ON P.SUBCATEGORY_ID = S.SUBCATEGORY_ID
JOIN dbo.categoryDim C ON S.CATEGORY_ID = C.CATEGORY_ID
GROUP BY C.CATEGORY
ORDER BY SALES_PROFIT_RATIO;
/*Which products experienced losses (negative profit)?*/
SELECT P.PRODUCT_NAME, SUM(F.PROFIT) AS TOTAL_PROFIT
FROM dbo.factSales F
JOIN dbo.productDim P ON F.PRODUCT_KEY = P.PRODUCT_ID
GROUP BY P.PRODUCT_NAME
HAVING SUM(F.PROFIT) < 0
ORDER BY TOTAL_PROFIT ASC;
/*Which regions and countries generate the highest total revenue*/
SELECT R.REGION, CN.COUNTRY,
SUM(F.SALES) AS TOTAL_SALES
FROM dbo.factSales F
JOIN dbo.geographyDim G ON F.GEOGRAPHY_KEY = G.GEOGRAPHY_ID
JOIN dbo.regionDim R ON G.REGION_ID = R.REGION_ID
JOIN dbo.countryDim CN ON G.COUNTRY_ID = CN.COUNTRY_ID
GROUP BY R.REGION, CN.COUNTRY
ORDER BY TOTAL_SALES DESC;
/*Which cities have the highest average sales per order?*/
SELECT CI.CITY, AVG(F.SALES) AS AVG_SALES_PER_ORDER
FROM dbo.factSales F
JOIN dbo.geographyDim G ON F.GEOGRAPHY_KEY = G.GEOGRAPHY_ID
JOIN dbo.cityDim CI ON G.CITY_ID = CI.CITY_ID
GROUP BY CI.CITY
ORDER BY AVG_SALES_PER_ORDER DESC;
/*Compare region-wise sales vs. profit — which region is the most efficient?*/
SELECT R.REGION,
SUM(F.SALES) AS TOTAL_SALES,
SUM(F.PROFIT) AS TOTAL_PROFIT,
CASE WHEN SUM(F.SALES) = 0 THEN 0 ELSE SUM(F.PROFIT)*1.0 / SUM(F.SALES) END AS PROFIT_EFFICIENCY
FROM dbo.factSales F
JOIN dbo.geographyDim G ON F.GEOGRAPHY_KEY = G.GEOGRAPHY_ID
JOIN dbo.regionDim R ON G.REGION_ID = R.REGION_ID
GROUP BY R.REGION
ORDER BY PROFIT_EFFICIENCY DESC;
/*What is the average discount percentage by region or country?*/
SELECT CN.COUNTRY,
AVG(F.DISCOUNT) AS AVG_DISCOUNT,
SUM(F.PROFIT) AS TOTAL_PROFIT
FROM dbo.factSales F
JOIN dbo.geographyDim G ON F.GEOGRAPHY_KEY = G.GEOGRAPHY_ID
JOIN dbo.countryDim CN ON G.COUNTRY_ID = CN.COUNTRY_ID
GROUP BY CN.COUNTRY
ORDER BY AVG_DISCOUNT DESC;





