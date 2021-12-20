-- SQL2.1 A selection (a WHERE clause)
-- This query finds all the data centres which is based in Oslo
SELECT *
FROM "data_center"
WHERE city ='Oslo';
-- SQL2.2 A projection (a SELECT with a defined attribute list, not just “*”)
-- This query finds  all data centers with capacity more than 800 servers
SELECT name, city
FROM "data_center"
WHERE capacity>800;

-- SQL2.3 An ORDER BY clause
--This query groups all data centres by capacity in descending order
SELECT capacity
FROM "data_center"
ORDER BY capacity DESC;

-- SQL2.4 An aggregation with grouping (GROUP BY)
--This query returns the number of data centers in each city
SELECT COUNT(Name), city
FROM "data_center"
GROUP BY city
ORDER BY COUNT(Name) DESC;

-- SQL2.5 A join over more than two (i.e., 3+) tables (any type of join)
-- This query joins 3 tables and returns the names of all data centers and the ids of their users

SELECT u.userid, dc.name
FROM "user" u JOIN data_manager dm ON U.userid = DM.userid JOIN "data_center" dc ON DM.data_center=DC.name;

-- SQL2.6 A union, intersect, or except operator
--This query selects all the users that haven’t used a virtual machine

SELECT "user".userid FROM "user"
    EXCEPT
SELECT vm.userid FROM vm
ORDER BY userid;


