/*
  HOL_SQLJoins.sql
  
  All of the queries use tables in the flights database.  


1. Write a SELECT statement that shows for all of the flights during the period February 14th to February 17th  
   for each of the four planes above: 'N125UW','N848MQ','N328AA','N247JB'
   Your select statement should return the following information:  
   tailnum, flight date information, departure delay, arrival delay, 3 digit destination code
*/

SELECT tailnum, year, month, day, dep_delay, arr_delay, dest
FROM flights
WHERE year = 2013 AND month = 2 AND day BETWEEN 14 AND 17
  AND tailnum IN('N125UW','N848MQ','N328AA','N247JB');

/*
2. Add a join clause, to also show destination airport name.  
   How many rows were returned?
*/

SELECT tailnum, year, month, day, dep_delay, arr_delay, dest, a.name
FROM flights f  INNER JOIN airports a  ON a.faa = f.dest
WHERE year = 2013 AND month = 2 AND day BETWEEN 14 AND 17
  AND tailnum IN('N125UW','N848MQ','N328AA','N247JB');


-- 3. now use a LEFT JOIN instead.  How many rows were returned?

SELECT tailnum, year, month, day, dep_delay, arr_delay, dest, a.name
FROM flights f  
LEFT JOIN airports a  ON a.faa = f.dest
WHERE year = 2013 AND month = 2 AND day BETWEEN 14 AND 17
  AND tailnum IN('N125UW','N848MQ','N328AA','N247JB');



-- 4. Add a second left join clause to also show the number of seats in the planes

SELECT f.tailnum, f.year, f.month, f.day, f.dep_delay, f.arr_delay, f.dest, a.name, p.seats
FROM flights f  
LEFT JOIN airports a  ON a.faa = f.dest
LEFT JOIN planes p    ON f.tailnum = p.tailnum
WHERE f.year = 2013 AND f.month = 2 AND f.day BETWEEN 14 AND 17
AND f.tailnum IN('N125UW','N848MQ','N328AA','N247JB');



-- 6. What are the names of the five airports that receive the most flights?  

SELECT a.faa, a.name, count(1)
FROM flights f 
INNER JOIN airports a  ON f.dest = a.faa
GROUP BY a.faa, a.name
ORDER BY COUNT(1) DESC LIMIT 5;

/*
   7. What are American Airlines’ destination cities from the New York airports?
   
   This query took about a minute to execute on my Windows laptop.  Consider:  how would you make it run faster?
*/


SELECT ap.name
FROM flights f  
INNER JOIN airports ap  ON f.dest = ap.faa
INNER JOIN airlines al  ON f.carrier = al.carrier
WHERE f.origin IN ('EWR','JFK','LGA') AND al.carrier = 'AA'
GROUP BY ap.name










   



