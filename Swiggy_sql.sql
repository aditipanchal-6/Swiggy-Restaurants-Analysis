DROP TABLE IF EXISTS swiggy_data;
CREATE TABLE swiggy_data(
id INT PRIMARY KEY,
name TEXT,
city TEXT,
rating FLOAT,
rating_count FLOAT,
cost FLOAT,
cuisine TEXT,
lic_no TEXT,
link TEXT,
address TEXT,
menu TEXT
);

COPY swiggy_data(id, name, city, rating, rating_count, cost, cuisine, lic_no, link, address, menu)
FROM 'C:/Users/Asus/Desktop/data analytics/cleaned_swiggy.csv'
DELIMITER ','
CSV HEADER
QUOTE '"'
ESCAPE '"';
SELECT * FROM swiggy_data;

--DATA EXPLORATION 
--1) TOTAL NUMBER OF RECORDS
SELECT COUNT(*) as total_restaurants
FROM swiggy_data;

--2)NUMBER OF UNIQUE CITIES
SELECT COUNT(DISTINCT city) AS unique_cities
FROM swiggy_data;

--MY ANALYSIS AND FINDINGS
--Q1)Which cities have the highest average restaurant ratings?
--considering only city with many restaurants, so i have taken threshold as 50 
SELECT city,
ROUND(AVG(rating)::numeric,2) AS avg_rating
FROM swiggy_data
WHERE rating IS NOT NULL
GROUP BY city
HAVING COUNT(*)>50 
ORDER BY avg_rating desc
LIMIT 10;

--Q2)Which restaurants have the lowest customer ratings across India?
SELECT id, name, city, rating, rating_count
FROM swiggy_data
WHERE rating IS NOT NULL
ORDER BY rating ASC, rating_count ASC
LIMIT 10;

--Q3)Do higher-rated restaurants tend to charge more?
SELECT ROUND(rating::numeric,1) AS rating_segment,
ROUND(AVG(cost)) AS avg_cost,
COUNT(*) AS total_restaurants
FROM swiggy_data
WHERE rating IS NOT NULL AND cost IS NOT NULL
GROUP BY rating_segment
ORDER BY rating_segment;

--Q4)What are the top 3 highest-rated restaurants in each city?
SELECT name, city, rating, rating_count
FROM(
SELECT name, city, rating, rating_count,
ROW_NUMBER() OVER (PARTITION BY city ORDER BY rating DESC, rating_count Desc) as rn
FROM swiggy_data
WHERE rating IS NOT NULL
) ranked
WHERE rn<=3;

--Q5)Top 10 most famous cuisine in Swiggy?
with diff_cuisine as (
SELECT TRIM(UNNEST(STRING_TO_ARRAY(cuisine,','))) as cuisine_types
FROM swiggy_data
WHERE cuisine IS NOT NULL
)
Select cuisine_types,
COUNT(*) as total_restaurants
FROM diff_cuisine
WHERE cuisine_types IS NOT NULL
GROUP BY cuisine_types
ORDER BY total_restaurants DESC
LIMIT 10;

--Q6)	What is the average cost and rating of restaurants by city and cuisine?
WITH cost_rating_cte AS(
SELECT city, TRIM(UNNEST(STRING_TO_ARRAY(cuisine,',')))as cuisine_types,
rating::numeric as rating,
cost::numeric as cost
FROM swiggy_data
WHERE cuisine IS NOT NULL AND
city IS NOT NULL AND rating IS NOT NULL
AND cost IS NOT NULL
)
SELECT city,
cuisine_types,
ROUND(AVG(rating),2) as avg_rating,
ROUND(AVG(cost),0) as avg_cost,
COUNT(*) AS total_restaurants
FROM cost_rating_cte
GROUP BY city, cuisine_types
ORDER BY city, avg_rating DESC;

--Q7)What percentage of restaurants are FSSAI licensed?
SELECT
COUNT(*) FILTER(WHERE lic_no IS NOT NULL)*100.0/COUNT(*) as FSSAI_licensed_percent,
COUNT(*) FILTER(WHERE lic_no IS NOT NULL) AS licensed_restaurants,
COUNT(*) FILTER(WHERE lic_no IS NULL)AS unlicensed_restuarants,
COUNT(*) AS total_restaurants
FROM swiggy_data;

--Q8)Non-Licensed restuarants city wise?
SELECT 
city,
name
FROM swiggy_data
WHERE city IS NOT NULL and lic_no IS NULL;

--Q9) Most Affordable yet highly rated cuisine across majorIndian cities?
WITH cost_rating_cte2 AS (
SELECT 
city,
TRIM(UNNEST(STRING_TO_ARRAY(cuisine, ','))) AS cuisine_type,
ROUND(AVG(rating::numeric), 2) AS avg_rating,
ROUND(AVG(cost::numeric), 0) AS avg_cost,
COUNT(*) AS total_restaurants
FROM swiggy_data
WHERE rating IS NOT NULL 
AND cost IS NOT NULL 
AND cuisine IS NOT NULL 
AND city IS NOT NULL
GROUP BY city, cuisine_type
)
SELECT *
FROM cost_rating_cte2
WHERE avg_rating>=4.0 and avg_cost<=300
ORDER BY city, avg_rating DESC;

--Q10)Which restaurants have high ratings but very few reviews (rating anomalies)?
SELECT name,
city,
rating,
rating_count
FROM swiggy_data
WHERE rating IS NOT NULL 
AND rating_count IS NOT NULL
AND rating >= 4.5
AND rating_count <20
ORDER BY rating DESC, rating_count ASC;

--Q11)Which cities have the fewest restaurants (expansion potential)?
SELECT 
  city,
  COUNT(*) AS total_restaurants
FROM swiggy_data
WHERE city IS NOT NULL
GROUP BY city
HAVING COUNT(*)<20 
ORDER BY total_restaurants ASC;








