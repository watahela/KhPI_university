-- task 1
SELECT UPPER(name) AS name_upcase
FROM cities
ORDER BY name
LIMIT 5 OFFSET 5;

-- task 2
SELECT name, CHAR_LENGTH(name) AS name_len
FROM cities
WHERE CHAR_LENGTH(name) NOT IN (8, 9, 10);

-- task 3
SELECT SUM(population) AS total_population
FROM cities
WHERE region IN ('C', 'S');

-- task 4
SELECT AVG(population) AS average_population
FROM cities
WHERE region = 'W';

-- task 5
SELECT COUNT(*) AS cities_count
FROM cities
WHERE region = 'E';

-- end 
