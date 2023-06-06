--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T2-tsa-select.sql

--Student ID: 31500153
--Student Name: Krishna Pillaai Manogaran
--Unit Code: FIT3171
--Applied Class No: 3

/* Comments for your marker:




*/

/*2(a)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT t.town_id, t.town_name, pt.poi_type_id, pt.poi_type_descr, COUNT(*) AS poi_count
FROM tsa.town t
INNER JOIN tsa.point_of_interest poi ON t.town_id = poi.town_id
INNER JOIN tsa.poi_type pt ON poi.poi_type_id = pt.poi_type_id
WHERE t.town_id IN (
    SELECT town_id
    FROM tsa.point_of_interest
    GROUP BY town_id
    HAVING COUNT(DISTINCT poi_type_id) > 1
)
GROUP BY t.town_id, t.town_name, pt.poi_type_id, pt.poi_type_descr
HAVING COUNT(*) > 1
ORDER BY t.town_id, pt.poi_type_descr;



/*2(b)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


/*2(c)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer



/*2(d)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


/*2(e)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer



/*2(f)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

