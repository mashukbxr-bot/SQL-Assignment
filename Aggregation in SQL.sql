Assignment- Aggregation in SQL\
Name- Md Mashuk Ali


Using the world database

USE world;
1: Count how many cities are there in each country?
SQL
SELECT CountryCode, COUNT(*) AS Total_Cities
FROM city
GROUP BY CountryCode;

2: Display all continents having more than 30 countries.
SQL
SELECT Continent, COUNT(*) AS Country_Count
FROM country
GROUP BY Continent
HAVING COUNT(*) > 30;

3: List regions whose total population exceeds 200 million.
SQL
SELECT Region, SUM(Population) AS Total_Population
FROM country
GROUP BY Region
HAVING SUM(Population) > 200000000;

4: Find the top 5 continents by average GNP per country.
SQL
SELECT Continent, AVG(GNP) AS Average_GNP
FROM country
GROUP BY Continent
ORDER BY Average_GNP DESC
LIMIT 5;

5: Find the total number of official languages spoken in each continent.
SELECT country.Continent, COUNT(countrylanguage.Language)
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'T'
GROUP BY country.Continent;

6: Find the maximum and minimum GNP for each continent.
We use the MAX() and MIN() functions to identify the range of GNP per continent.
SQL
SELECT Continent, MAX(GNP) AS Max_GNP, MIN(GNP) AS Min_GNP
FROM country
GROUP BY Continent;

7: Find the country with the highest average city population.
We join the country and city tables, calculate the average, and limit the output to the single highest result.
SELECT country.Name
FROM country
JOIN city ON country.Code = city.CountryCode
GROUP BY country.Name
ORDER BY AVG(city.Population) DESC
LIMIT 1;

8: List continents where the average city population is greater than 200,000.
SELECT country.Continent
FROM country
JOIN city ON country.Code = city.CountryCode
GROUP BY country.Continent
HAVING AVG(city.Population) > 200000;

9: Total population and average life expectancy for each continent.
SQL
SELECT Continent, SUM(Population) AS Total_Population, AVG(LifeExpectancy) AS Avg_Life_Expectancy
FROM country
GROUP BY Continent
ORDER BY Avg_Life_Expectancy DESC;

10: Top 3 continents with highest average life expectancy (Total Population > 200M).
SQL
SELECT Continent, AVG(LifeExpectancy) AS Avg_Life_Expectancy
FROM country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY Avg_Life_Expectancy DESC
LIMIT 3;