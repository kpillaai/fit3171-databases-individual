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
/*
SELECT
    m.member_id,
    m.member_fname,
    m.resort_id,
    r.resort_name,
    COUNT(*) AS recommendation_count
FROM
    tsa.member m
    JOIN tsa.resort r ON m.resort_id = r.resort_id
WHERE
    m.member_id IN (
        SELECT
            member_id_recby
        FROM
            tsa.member
        GROUP BY
            member_id_recby
        HAVING
            COUNT(*) = (
                SELECT
                    COUNT(*)
                FROM
                    tsa.member
                GROUP BY
                    member_id_recby
                ORDER BY
                    COUNT(*) DESC
            )
    )
GROUP BY
    m.member_id,
    m.member_fname,
    m.resort_id,
    r.resort_name
ORDER BY
    m.resort_id,
    m.member_id;
*/


/*2(c)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
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
        ELSE TO_CHAR(ROUND(r.avg_rating, 2))
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


/*2(d)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
-- NEED TO DO LOCATION
/*
SELECT
    p.poi_name,
    pt.poi_type_descr,
    t.town_name,
    CONCAT('Lat: ', LPAD(t.town_lat, 11, ' ')) AS town_location,
    COUNT(r.review_id) AS reviews_completed,
    CASE
        WHEN COUNT(r.review_id) = 0 THEN 'No reviews completed'
        ELSE ROUND((COUNT(r.review_id) * 100.0) / total_reviews.total_count, 2)
    END AS percent_of_reviews
FROM
    tsa.point_of_interest p
    JOIN tsa.poi_type pt ON p.poi_type_id = pt.poi_type_id
    JOIN tsa.town t ON p.town_id = t.town_id
    LEFT JOIN tsa.review r ON p.poi_id = r.poi_id
    CROSS JOIN (SELECT COUNT(review_id) AS total_count FROM tsa.review) total_reviews
GROUP BY
    p.poi_name,
    pt.poi_type_descr,
    t.town_name,
    t.town_lat,
    total_reviews.total_count
ORDER BY
    t.town_name,
    reviews_completed DESC,
    p.poi_name;

*/



/*2(e)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer



/*2(f)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

