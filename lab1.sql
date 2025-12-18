-- task 1
SELECT * FROM cities 
ORDER BY population DESC 
LIMIT 10 OFFSET 10;

-- task 2
SELECT * FROM cities 
ORDER BY name DESC 
LIMIT 30;

-- task 3
SELECT * FROM cities 
ORDER BY region ASC, population DESC;

-- task 4
SELECT DISTINCT region 
FROM cities;

-- task 5
SELECT * FROM cities 
ORDER BY region DESC, name DESC;
