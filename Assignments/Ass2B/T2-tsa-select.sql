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

/*2(b)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
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

/*2(c)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    p.poi_id,
    p.poi_name,
    CASE
        WHEN max_rating IS NULL THEN 'NR'
        ELSE TO_CHAR(max_rating)
    END AS max_rating,
    CASE
        WHEN min_rating IS NULL THEN 'NR'
        ELSE TO_CHAR(min_rating)
    END AS min_rating,
    CASE
        WHEN avg_rating IS NULL THEN 'NR'
        ELSE RPAD(TO_CHAR(ROUND(avg_rating, 1), '9.9'), 20, ' ')
    END AS avg_rating
FROM
    tsa.point_of_interest p
    LEFT OUTER JOIN (
        SELECT
            poi_id,
            MAX(review_rating) as max_rating,
            MIN(review_rating) as min_rating,
            AVG(review_rating) as avg_rating
        FROM
            tsa.review
        GROUP BY
            poi_id)
    r ON p.poi_id = r.poi_id
ORDER BY
    p.poi_id;

/*2(d)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    p.poi_name,
    pt.poi_type_descr,
    t.town_name,
    LPAD('Lat: '
    || ''
    || TO_CHAR(t.town_lat, '99.999999')
    || ' Long: '
    || TO_CHAR(t.town_long, '999.999999'), 35, ' ') AS town_location,
    COUNT(r.review_id) as reviews_completed,
    CASE
        WHEN COUNT(r.review_id) = 0 THEN 'No reviews completed'
        ELSE TO_CHAR(ROUND((COUNT(r.review_id) * 100) / (SELECT COUNT(*) FROM tsa.review), 2)) || '%'
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

/*2(e)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    r.resort_id,
    r.resort_name,
    m.member_no,
    m.member_gname
    || ' '
    || m.member_fname as member_name,
    RPAD(m.member_date_joined, 20, ' ') as date_joined,
    RPAD(m2.member_no
    || ' '
    || m2.member_gname
    || ' '
    || m2.member_fname, 35, ' ') as recommended_by_details,
    LPAD('$' || ROUND(mc.mc_total), 13, ' ') as total_charges
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

/*2(f)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    r.resort_id,
    r.resort_name,
    p.poi_name,
    t.town_name AS poi_town,
    RPAD(t.town_state, 10, ' ') AS poi_state,
    CASE
        WHEN p.poi_open_time IS NULL THEN 'Not Applicable'
        WHEN TO_NUMBER(TO_CHAR(p.poi_open_time, 'HH24')) < 12 THEN RPAD(TO_CHAR(p.poi_open_time, 'HH12:MI') || 'AM', 20, ' ')
        ELSE RPAD(TO_CHAR(p.poi_open_time, 'HH12:MI') || 'PM', 20, ' ')
    END AS poi_opening_time,
    ROUND(geodistance(poit.town_lat, poit.town_long, t.town_lat, t.town_long),1) 
    || ' Kms' AS distance
FROM
    tsa.town t
    JOIN tsa.resort r ON r.town_id = t.town_id
    JOIN tsa.town poit ON geodistance(t.town_lat, t.town_long, poit.town_lat, poit.town_long) <= 100
    JOIN tsa.point_of_interest p ON p.town_id = poit.town_id
ORDER BY
    r.resort_name,
    distance;



