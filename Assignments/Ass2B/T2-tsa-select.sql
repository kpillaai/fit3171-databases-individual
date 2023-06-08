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
-- (;) at the end of this answer DONE
/*
SELECT
    town_id,
    town_name,
    poi_type_id,
    poi_type_descr,
    COUNT(poi_type_id) AS poi_count
FROM
    tsa.town
    NATURAL JOIN tsa.point_of_interest
    NATURAL JOIN tsa.poi_type
GROUP BY
    town_id,
    town_name,
    poi_type_id,
    poi_type_descr
ORDER BY
    town_id,
    poi_type_descr;
*/

/*2(b)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer DONE
/*
SELECT
    m.member_id,
    m.member_gname
    || ' '
    || m.member_fname AS member_name,
    r.resort_id,
    r.resort_name,
    COUNT(m2.member_id_recby) AS number_of_recommendations
FROM
    tsa.member m
    JOIN tsa.resort r ON m.resort_id = r.resort_id
    JOIN tsa.member m2 ON m.member_id = m2.member_id_recby
GROUP BY
    m.member_id,
    m.member_gname
    || ' '
    || m.member_fname,
    r.resort_id,
    r.resort_name
ORDER BY
    r.resort_id,
    m.member_id;
*/

/*2(c)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer DONE
/*
SELECT
    p.poi_id,
    p.poi_name,
    CASE
        WHEN r.max_rating IS NULL THEN 'NR'
        ELSE TO_CHAR(r.max_rating)
    END AS max_rating,
    CASE
        WHEN r.min_rating IS NULL THEN 'NR'
        ELSE TO_CHAR(r.min_rating)
    END AS min_rating,
    CASE
        WHEN r.avg_rating IS NULL THEN 'NR'
        ELSE TO_CHAR(ROUND(r.avg_rating, 1))
    END AS avg_rating
FROM
    tsa.point_of_interest p
LEFT OUTER JOIN (
    SELECT
        poi_id,
        MAX(review_rating) AS max_rating,
        MIN(review_rating) AS min_rating,
        AVG(review_rating) AS avg_rating
    FROM
        tsa.review
    GROUP BY
        poi_id
    ) r ON p.poi_id = r.poi_id
ORDER BY
    p.poi_id;
*/

/*2(d)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
-- NEED TO DO DECIMAL PLACES FOR LAT AND LONG OTHERWISE DONE
/*
SELECT
    p.poi_name,
    pt.poi_type_descr,
    t.town_name,
    LPAD('Lat: '
    || ''
    || t.town_lat
    || ' Long: '
    || t.town_long, 35, ' ') AS town_location,
    COUNT(r.review_id) as reviews_completed,
    CASE
        WHEN COUNT(r.review_id) = 0 THEN 'No reviews completed'
        ELSE TO_CHAR(ROUND((COUNT(r.review_id) * 100) / (SELECT COUNT(*) FROM tsa.review), 2))
    END AS percent_of_reviews
FROM
    tsa.point_of_interest p
    JOIN tsa.poi_type pt ON p.poi_type_id = pt.poi_type_id
    JOIN tsa.town t ON p.town_id = t.town_id
    LEFT OUTER JOIN tsa.review r on p.poi_id = r.poi_id
GROUP BY
    p.poi_name,
    pt.poi_type_descr,
    t.town_name,
    t.town_lat,
    t.town_long
ORDER BY 
    t.town_name, 
    reviews_completed DESC,
    p.poi_name;
*/

/*2(e)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
-- NEED TO DO FORMATTING 
SELECT
    r.resort_id,
    r.resort_name,
    m.member_no,
    m.member_gname
    || ' '
    || m.member_fname as member_name,
    m.member_date_joined as date_joined,
    m2.member_no
    || ' '
    || m2.member_gname
    || ' '
    || m2.member_fname as recommended_by_details,
    '$' || mc.mc_total as total_charges
FROM
    tsa.member m
    JOIN tsa.resort r ON m.resort_id = r.resort_id
    JOIN tsa.town t ON t.town_id = r.town_id
    JOIN tsa.member_charge mc ON m.member_id = mc.member_id
    JOIN tsa.member m2 ON m.member_id_recby = m2.member_id
WHERE
    UPPER(t.town_name) != UPPER('Byron Bay') AND
    UPPER(t.town_state) != UPPER('NSW') AND
    m.member_id_recby IS NOT NULL AND
    mc.mc_total < (
        SELECT 
            AVG(mc2.mc_total) 
        FROM 
            tsa.member_charge mc2
            JOIN tsa.member m2 ON m2.member_id = mc2.member_id)
ORDER BY
    r.resort_id,
    m.member_no;
    
/*
select * from tsa.member m
    JOIN tsa.resort r ON m.resort_id = r.resort_id
    JOIN tsa.town t ON t.town_id = r.town_id
    JOIN tsa.member_charge mc ON m.member_id = mc.member_id
    JOIN tsa.member m2 ON m.member_id_recby = m2.member_id where mc.mc_total < (SELECT AVG(mc_total) FROM tsa.member_charge WHERE member_id = m.member_id);
*/
/*2(f)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

