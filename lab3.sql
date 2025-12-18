-- task 1
SELECT * FROM cities 
WHERE name LIKE '%ськ';

--task 2
SELECT * FROM cities 
WHERE name LIKE '%донец%';

-- task 3
SELECT CONCAT(name, ' (', region, ')') AS city_region
FROM cities 
WHERE population > 100000 
ORDER BY name;

-- task 4
SELECT name, population, (population / 40000000 * 100) AS population_percent
FROM cities 
ORDER BY population DESC 
LIMIT 10;

--task 5
SELECT CONCAT(name, ' - ', (population / 40000000 * 100), ' %') AS city_stat
FROM cities 
WHERE (population / 40000000 * 100) >= 0.1
ORDER BY (population / 40000000 * 100) DESC;

-- end
