-- task 1
SELECT region, SUM(population) AS region_population
FROM cities
GROUP BY region;

-- task 2
SELECT region, SUM(population) AS region_population
FROM cities
GROUP BY region
HAVING COUNT(*) >= 10;

-- task 3
SELECT name, population
FROM cities
WHERE region IN (
    SELECT region
    FROM cities
    GROUP BY region
    HAVING COUNT(*) >= 5
)
ORDER BY population DESC
LIMIT 5 OFFSET 10;

-- task 4
SELECT region, SUM(population) AS big_cities_population
FROM cities
WHERE population > 300000
GROUP BY region;

-- task 5
SELECT name, population, region
FROM cities
WHERE region IN (
    SELECT uuid
    FROM regions
    WHERE area_quantity <= 5
)
AND population NOT BETWEEN 150000 AND 500000
ORDER BY population DESC;

-- end 
