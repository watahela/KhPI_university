-- task 1
SELECT * FROM cities 
WHERE population >= 1000000;

-- task 2
SELECT * FROM cities 
WHERE region = 'E' OR region = 'W' 
ORDER BY population DESC;

--task 3
SELECT * FROM cities 
WHERE population > 50000 AND region IN ('S', 'C', 'N');

--task 4
SELECT * FROM cities 
WHERE population > 150000 
  AND population <= 350000 
  AND region IN ('E', 'W', 'N') 
ORDER BY name 
LIMIT 20;

-- task 5
SELECT * FROM cities 
WHERE region NOT IN ('E', 'W') 
ORDER BY population DESC 
LIMIT 10 OFFSET 10;

-- end
