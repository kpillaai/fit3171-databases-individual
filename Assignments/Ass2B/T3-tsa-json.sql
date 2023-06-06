--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-tsa-json.sql

--Student ID:
--Student Name:
--Unit Code:
--Applied Class No:

/* Comments for your marker:




*/

/*3(a)*/
-- PLEASE PLACE REQUIRED SQL STATEMENT TO GENERATE 
-- THE COLLECTION OF JSON DOCUMENTS HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SET PAGESIZE 300

SELECT
    JSON_OBJECT ( '_id' VALUE stuid, 'name' VALUE stufname
                || ' '
                || stulname,
                'location' VALUE JSON_OBJECT (
                                'latitude' VALUE stuaddress,
                                'longitude' VALUE stuemail ),
                'avg_temperature' VALUE JSON_OBJECT (
                                'summer' VALUE stuaddress,
                                'winter' VALUE stuemail ),
                'dob' VALUE to_char(studob, 'dd-mm-yyyy'),
                'no_of_resorts' VALUE stuid,
                'resorts' VALUE JSON_ARRAYAGG(
                                JSON_OBJECT('id' VALUE unitcode,
                                'name' VALUE unitname,
                                'address' VALUE enrolmark,
                                'phone' VALUE ofsemester,
                                'year_built' VALUE to_char(ofyear, 'yyyy'),
                                'company_name' VALUE enrolgrade))
    FORMAT JSON )
    || ','
FROM
    uni.student
    NATURAL JOIN uni.enrolment
    NATURAL JOIN uni.unit
GROUP BY
    stuid,
    stufname,
    stulname,
    stuaddress,
    stuphone,
    stuemail,
    studob
ORDER BY
    stuid;
