-- task 1
SELECT cities.name, regions.name
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE cities.population > 350000;

-- task 2
SELECT cities.name
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE regions.name = 'Nord';

-- end
