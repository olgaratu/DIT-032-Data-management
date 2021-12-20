--SQL4.1 Write a query to list all volcanic mountains
SELECT name
FROM mountain
WHERE type='volcanic';

--SQL4.2 Write a query to show how many mountains of type “volcanic” or “Plateau”
SELECT COUNT (name)
FROM mountain
WHERE type='volcanic' OR type='Plateau';
--SQL4.3 Return the names of all mountains of unspecified type ordered in reverse alphabetical order.

SELECT name
FROM mountain
WHERE type IS NULL
ORDER BY name DESC;

--SQL4.4 Return the names of all deserts, and the country codes of all countries bordering
--them.Ensure  that the result does not contain duplicate rows.

SELECT DISTINCT desert.name, country.code
FROM desert JOIN geo_desert ON desert.name=geo_desert.desert  join country ON geo_desert.country=country.code;

--SQL4.5 Write a query to show how many countries are members in “G-24” and located in Asia. Please
--display all the country names and codes that are members in “G-24” and not located in Asia.

SELECT COUNT(country) as num_country
FROM  encompasses e
          INNER JOIN ismember i
                     ON e.country = i.country
WHERE organization ='G-24' and continent ='Asia' AND type ='member';


SELECT c.code, c.name
FROM encompasses e JOIN country c
                        ON e.country = c.code
                   JOIN ismember i on e.country = i.country
Where continent <> 'Asia' AND i.organization = 'G-24' AND type ='member';

--SQL4.6 Return the names of “waters” of all kinds (i.e., lakes, rivers, and seas), ordered by their
--name.  Add a column “type” that indicates what type of water it is (either lake, river, or sea).

WITH waters AS (
    (SELECT name, 'sea' as type FROM sea)
    UNION
    (SELECT name, 'lake' as type FROM lake)
    UNION
    (SELECT name,'river' AS type FROM river))
SELECT *
FROM waters
ORDER BY name;

--SQL4.7 The continent name and average GDP for each continent. If a country is on multiple
--continents,  count their GDP towards the average calculation for all their continents.

WITH avg_count AS (
    SELECT enc.country AS country , SUM(gdp*(enc.percentage/100)) AS sum_gdp, COUNT(enc.country) as count
    FROM encompasses enc
             JOIN economy eco
                  ON enc.country = eco.country
    GROUP BY enc.country)
SELECT continent, AVG(sum_gdp/count)
FROM encompasses
         JOIN avg_count
              ON avg_count.country = encompasses.country
GROUP BY continent;

--SQL4.8 Write a query to display the name of all countries that only have borders longer than 100 km.

WITH shortBorders AS (
    (SELECT country1 AS country FROM borders WHERE length<=100)
    UNION DISTINCT
    (SELECT country2 AS country FROM borders WHERE length<=100))
    (SELECT name FROM country) EXCEPT (SELECT country FROM shortBorders);

--SQL4.9 Write a query to return all countries with a higher percentage of English speakers than in the  United States of America.
--Use the country code “USA”. Implement this as a single query, and don’t  use the percentage of English speakers in the US as a constant in this query.

WITH us_english_percentage as
         (SELECT language.percentage FROM language where language.country = 'USA' and language.name = 'English')
SELECT language.country
FROM language CROSS JOIN us_english_percentage where language.name = 'English' and language.percentage > us_english_percentage.percentage;


