--A new duplicate table for the following cleaning process
CREATE TEMP TABLE IF NOT EXISTS sales_staging AS
SELECT * FROM sales;


WITH duplicate_cte AS --Examine the duplicate records
(
	SELECT *,
	ROW_NUMBER() OVER(
		PARTITION BY store, date, weekly_sales, holiday_flag, 
		temperature, fuel_price, cpi, unemployment) AS row_num
	FROM sales_staging
)
SELECT * 
FROM duplicate_cte 
WHERE row_num > 1;

SELECT *
FROM sales_staging;

--Standardize the whole table by examining each column
SELECT DISTINCT(store)
FROM sales_staging
ORDER BY 1;

SELECT date, TO_DATE(date, 'DD-MM-YYYY')
FROM sales_staging;

UPDATE sales_staging
SET date = TO_DATE(date, 'DD-MM-YYYY');

ALTER TABLE sales_staging 
ALTER COLUMN date TYPE DATE
USING date::DATE;

--Check the NULL. Integer, numeric, date won't have a blank space.
SELECT *
FROM sales_staging
WHERE store IS NULL 
	OR date IS NULL
	OR weekly_sales IS NULL
	OR holiday_flag IS NULL
	OR temperature IS NULL
	OR fuel_price IS NULL
	OR cpi IS NULL
	OR unemployment IS NULL;
		
CREATE TEMP TABLE IF NOT EXISTS sales_staging2 AS
SELECT * FROM sales_staging
WHERE EXTRACT(MONTH FROM date) BETWEEN 2 AND 10;
SELECT * FROM sales_staging2;

--Overall Performance

SELECT
    store,
    SUM(weekly_sales) AS total_sales_2011,
    ROUND(AVG(weekly_sales), 2) AS avg_weekly_sales_2011
FROM
    sales_staging
WHERE
    EXTRACT(YEAR FROM date) = 2011
GROUP BY
    store
ORDER BY
    total_sales_2011 DESC


SELECT
    EXTRACT(MONTH FROM date) AS sales_month,
	EXTRACT(WEEK FROM date) AS sales_week,
    SUM(weekly_sales) AS total_company_sales
FROM
    sales_staging
WHERE
    EXTRACT(YEAR FROM date) = 2011
GROUP BY
    sales_month, sales_week
ORDER BY
    sales_month;

SELECT
    date,
    SUM(weekly_sales) AS total_company_sales
FROM
    sales_staging
WHERE
    EXTRACT(YEAR FROM date) = 2011
GROUP BY
    date
ORDER BY
    date;



--yoy growth percentage for top 10 sales stores
WITH YearlySales_per_store AS (
    SELECT
        store,
        date_part('year', date) AS sale_year,
        SUM(Weekly_Sales) AS total_yearly_sales
    FROM sales_staging2
    GROUP BY store, sale_year
),
SalesWithLag AS (
    SELECT
        store,
        sale_year,
        total_yearly_sales,
        LAG(total_yearly_sales, 1) OVER (PARTITION BY Store ORDER BY sale_year) AS previous_year_sales
    FROM YearlySales_per_store
)
SELECT
	store,
    sale_year,
    total_yearly_sales,
	yoy_growth_pct_per_store
FROM (
	SELECT
		store,
		sale_year,
		total_yearly_sales,
		ROUND((total_yearly_sales - previous_year_sales) / previous_year_sales * 100, 2)AS yoy_growth_pct_per_store
	FROM SalesWithLag
	WHERE store IN 
		(SELECT store 
		 FROM sales_staging2
		 GROUP BY store 
		 ORDER BY SUM(Weekly_Sales) DESC 
		 LIMIT 10)
)WHERE yoy_growth_pct_per_store IS NOT NULL;



--YoY growth for all Stores
WITH YearlySales_per_store AS (
    SELECT
        store,
        date_part('year', date) AS sale_year,
        SUM(Weekly_Sales) AS total_yearly_sales
    FROM sales_staging2
    GROUP BY store, sale_year
),
SalesWithLag AS (
    SELECT
        store,
        sale_year,
        total_yearly_sales,
        LAG(total_yearly_sales, 1) OVER (PARTITION BY Store ORDER BY sale_year) AS previous_year_sales
    FROM YearlySales_per_store
)
SELECT
	store,
    sale_year,
    total_yearly_sales,
	yoy_growth_pct_per_store
FROM (
	SELECT
		store,
		sale_year,
		total_yearly_sales,
		ROUND((total_yearly_sales - previous_year_sales) / previous_year_sales * 100, 2)AS yoy_growth_pct_per_store
	FROM SalesWithLag
)WHERE yoy_growth_pct_per_store IS NOT NULL
ORDER BY sale_year, yoy_growth_pct_per_store DESC;

--holiday&non-holiday yearly sales
WITH HolidayAverages AS (
  SELECT
    store,
    -- Calculate the average sales ONLY for holiday weeks
    ROUND(AVG(CASE WHEN holiday_flag = 1 THEN weekly_sales END), 2) AS avg_holiday_sales_stores,
    -- Calculate the average sales ONLY for non-holiday weeks
    ROUND(AVG(CASE WHEN holiday_flag = 0 THEN weekly_sales END), 2) AS avg_non_holiday_sales_stores
  FROM
    sales_staging
  GROUP BY
    store
)
SELECT
  store,
  avg_holiday_sales_stores,
  avg_non_holiday_sales_stores,
  -- Subtract non-holiday from holiday sales to get the increase
  ROUND(avg_holiday_sales_stores - avg_non_holiday_sales_stores, 2) AS stores_holiday_dollar_increase
FROM
  HolidayAverages
ORDER BY
  -- Sort by the increase to find the superstars at the top
  stores_holiday_dollar_increase DESC;

SELECT ROUND(AVG(CASE WHEN holiday_flag = 1 THEN weekly_sales END), 2) AS avg_total_holiday_sales,
	ROUND(AVG(CASE WHEN holiday_flag = 0 THEN weekly_sales END), 2) AS avg_total_non_holiday_sales
FROM sales_staging;