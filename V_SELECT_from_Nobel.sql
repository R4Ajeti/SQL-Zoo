--1) Change the query shown so that it displays Nobel prizes for 1950.

SELECT yr, subject, winner FROM nobel
 WHERE yr = 1960;

--2) Show who won the 1962 prize for Literature.

SELECT winner FROM nobel
 WHERE yr = 1962 AND subject = 'Literature';

--3) Show the year and subject that won 'Albert Einstein' his prize.

SELECT yr,subject FROM nobel
 WHERE winner = 'Albert Einstein';

--4) Give the name of the 'Peace' winners since the year 2000, including 2000.

SELECT winner FROM nobel
 WHERE subject = 'Peace' AND yr >= 2000;

--5) Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.

SELECT * FROM nobel
 WHERE subject = 'Literature' AND yr between 1980 AND 1989;

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