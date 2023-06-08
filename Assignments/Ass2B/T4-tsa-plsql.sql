--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-tsa-plsql.sql

--Student ID:
--Student Name:
--Unit Code:
--Applied Class No:

/* Comments for your marker:

*/

SET SERVEROUTPUT ON

--4(a) 
-- Create a sequence for REVIEW PK
DROP SEQUENCE review_id_seq;

CREATE SEQUENCE review_id_seq
    START WITH 100 INCREMENT BY 10;

-- Complete the procedure below
CREATE OR REPLACE PROCEDURE prc_insert_review (
    p_member_id      IN NUMBER,
    p_poi_id         IN NUMBER,
    p_review_comment IN VARCHAR2,
    p_review_rating  IN NUMBER,
    p_output         OUT VARCHAR2
) AS
    p_member_id_found   NUMBER;
    p_poi_id_found      NUMBER;
BEGIN
    SELECT
        COUNT(*)
    INTO 
        p_member_id_found
    FROM 
        tsa.member
    WHERE
        member_id = p_member_id;
    
    SELECT
        COUNT(*)
    INTO
        p_poi_id_found
    FROM
        tsa.point_of_interest
    WHERE
        poi_id = p_poi_id;
        
    IF (p_member_id_found = 0) THEN
        p_output := 'Invalid member id';
    ELSE
        
        IF (p_poi_id_found = 0) THEN
            p_output := 'Invalid POI id';
        ELSE
            INSERT INTO review VALUES (review_id_seq.NEXTVAL, p_member_id, sysdate, p_review_comment, p_review_rating, p_poi_id);
            p_output := 'New review added';
        END IF;
    
    END IF;

END;
/

-- Write Test Harness for 4(a)
--execute the procedure 
DECLARE
    output VARCHAR2(200);
BEGIN
    --call the procedure - invalid member_id
    prc_insert_review(5000, 1, 'Good place', 3, output);
    dbms_output.put_line(output);
END;
/

--execute the procedure 
DECLARE
    output VARCHAR2(200);
BEGIN
    --call the procedure - invalid poi_id
    prc_insert_review(1, 5000, 'Good place', 3, output);
    dbms_output.put_line(output);
END;
/

--execute the procedure 
DECLARE
    output VARCHAR2(200);
BEGIN
    --call the procedure - success
    prc_insert_review(1, 1, 'Good place', 3, output);
    dbms_output.put_line(output);
END;
/

--4(b) 
--Write your trigger statement, 
--finish it with a slash(/) followed by a blank line















-- Write Test Harness for 4(b)

