--1) Observe the result of running this SQL command to show the name, continent and population of all countries.

SELECT name, continent, population FROM world;

--2) Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.

SELECT name FROM world
WHERE population >200000000;

/*
  HELP:How to calculate per capita GDP
  per capita GDP is the GDP divided by the population GDP/population
*/
--3) Give the name and the per capita GDP for those countries with a population of at least 200 million.

SELECT name,gdp/population as 'gdp/population' FROM world
WHERE population>200000000;

--4) Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.

SELECT name,population/1000000 as 'pupulation/1000000' FROM world
WHERE continent='South America';

--5) Show the name and population for France, Germany, Italy

SELECT name,population FROM world
WHERE name in ('France','Germany','Italy');

--6) Show the countries which have a name that includes the word 'United'

SELECT name FROM world
WHERE name like '%United%';

/*
  Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
*/
--7) Show the countries that are big by area or big by population. Show name, population and area.

SELECT name,population,area from world
WHERE area>3000000 or population>250000000;

/*
  Australia has a big area but a small population, it should be included.
  Indonesia has a big population but a small area, it should be included.
  China has a big population and big area, it should be excluded.
  United Kingdom has a small population and a small area, it should be excluded.
*/
--8) Exclusive OR (XOR). Show the countries that are big by area or big by population but not both. Show name, population and area.

SELECT name, population, area from world
WHERE area>3000000 XOR population>250000000;

/*
  Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
*/
--9) For South America show population in millions and GDP in billions both to 2 decimal places.

SELECT name, ROUND(population/1000000,2) as 'population/1000000', ROUND(gdp/1000000000,2) as 'gdp/1000000000' from world
WHERE continent='South America';

/*
  Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
*/
--10) Show per-capita GDP for the trillion dollar countries to the nearest $1000.

SELECT name,ROUND(gdp/(population*1000))*1000 from world
WHERE gdp>1000000000000;

/*
  Greece has capital Athens.

  Each of the strings 'Greece', and 'Athens' has 6 characters.
  You can use the LENGTH function to find the number of characters in a string
*/
--11) Show the name and capital where the name and the capital have the same number of characters.

SELECT name, capital
  FROM world
 WHERE LENGTH(name)=LENGTH(capital);

/*
  The capital of Sweden is Stockholm. Both words start with the letter 'S'.
  
  You can use the function LEFT to isolate the first character.
  You can use <> as the NOT EQUALS operator.
*/
--12) Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.

SELECT name, capital
FROM world
where LEFT(name,1)=LEFT(capital,1) and name<>capital;

/*
  Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.
  
  You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
  The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'
*/
--13) Find the country that has all the vowels and no spaces in its name

SELECT capital, name FROM world
 WHERE capital like concat('%', concat(name,'%'));

/*
  You should include Mexico City as it is longer than Mexico. You should not include Luxembourg as the capital is the same as the country.
*/
--14) Find the capital and the name where the capital is an extension of name of the country.

SELECT capital, name FROM world
 WHERE capital LIKE concat(name,'%') and name<>capital;

/*
  For Monaco-Ville the name is Monaco and the extension is -Ville.
  You can use the SQL function REPLACE.
*/
--15) Show the name and the extension where the capital is an extension of name of the country.

SELECT name, REPLACE(capital, name,'') as ext FROM world
 WHERE capital LIKE concat(name,'%') and name<>capital;