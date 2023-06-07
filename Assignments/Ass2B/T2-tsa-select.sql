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
-- (;) at the end of this answer NOT DONE
SELECT
    member_id,
    member_gname
    || ' '
    || member_fname AS member_name,
    resort_id,
    resort_name,
    COUNT(review_id) AS number_of_recommendations
FROM
    tsa.member
    NATURAL JOIN tsa.resort
    NATURAL JOIN tsa.review
GROUP BY
    member_id,
    member_gname
    || ' '
    || member_fname,
    resort_id,
    resort_name
ORDER BY
    resort_id,
    member_id;

select * from tsa.member where member_id_recby = 2;
/*2(c)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer DONE
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


/*2(d)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
-- NEED TO DO reviews percentage and left pad
SELECT
    poi_name,
    poi_type_descr,
    town_name,
    'Lat: '
    || ''
    || town_lat
    || ' Long: '
    || town_long AS town_location,
    COUNT(review_id) as reviews_completed
FROM
    tsa.point_of_interest
    NATURAL JOIN tsa.poi_type
    NATURAL JOIN tsa.town
    NATURAL JOIN tsa.review
GROUP BY
    poi_name,
    poi_type_descr,
    town_name,
    town_lat,
    town_long
ORDER BY 
    town_name, 
    reviews_completed,
    poi_name;



/*2(e)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    resort_id,
    resort_name,
    member_no,
    member_gname
    || ' '
    || member_fname as member_name,
    member_date_joined as date_joined,
    (SELECT
        member_no
        || ' '
        || member_gname
        || ' '
        || member_fname
    FROM
        tsa.member
    WHERE
        member_id = member_id_recby
    ) as recommended_by_details,
    mc_total
FROM
    tsa.member
    NATURAL JOIN tsa.resort
    NATURAL JOIN tsa.town
    NATURAL JOIN tsa.member_charge
WHERE
    town_name != 'Byron Bay' 
    AND town_state != 'NSW'
    AND member_id_recby IS NOT NULL
ORDER BY
    resort_id,
    member_no;
    

/*2(f)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

