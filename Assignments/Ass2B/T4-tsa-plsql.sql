--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-tsa-plsql.sql

--Student ID: 31500153
--Student Name: Krishna Pillaai Manogaran
--Unit Code: FIT3171
--Applied Class No: 3

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
    prc_insert_review(1, 1, 'Good place to visit', 3, output);
    dbms_output.put_line(output);
END;
/

rollback;

--4(b) 
--Write your trigger statement, 
--finish it with a slash(/) followed by a blank line
CREATE OR REPLACE TRIGGER new_member_reg
BEFORE INSERT on member
FOR EACH ROW
DECLARE
    member_id_check         NUMBER;
    resort_id_check         NUMBER;
    member_no_check         NUMBER;
    member_id_recby_check   NUMBER;
BEGIN
    SELECT
        COUNT(*)
    INTO 
        member_id_check
    FROM
        member
    WHERE
        member_id = :new.member_id;
        
    SELECT
        COUNT(*)
    INTO 
        resort_id_check
    FROM
        resort
    WHERE
        resort_id = :new.resort_id;
        
    SELECT
        COUNT(*)
    INTO 
        member_no_check
    FROM
        member
    WHERE
        member_no = :new.member_no AND
        resort_id = :new.resort_id;
        
    SELECT
        COUNT(*)
    INTO 
        member_id_recby_check
    FROM
        member
    WHERE
        member_id = :new.member_id_recby AND
        resort_id = :new.resort_id;

    IF (member_id_check > 0) THEN
        raise_application_error(-20001, 'Member with this id is already registered');
    ELSE
        IF (resort_id_check = 0) THEN
            raise_application_error(-20002, 'Resort with this id does not exist');
        ELSE
            IF (member_no_check > 0) THEN
                raise_application_error(-20003, 'Member with this number is already resgistered');
            ELSE
                IF (member_id_recby_check = 0) THEN
                    raise_application_error(-20004, 'New member may only be recommended by another member within the same resort');
                ELSE
                    UPDATE 
                        member
                    SET
                        member_points = member_points + 10
                    WHERE
                        member_id = :new.member_id_recby;
                END IF;
            END IF;
        END IF;
    END IF;
END;
/

-- Write Test Harness for 4(b)
-- Before value
SELECT * FROM member;

-- Insert duplicate id
INSERT INTO member (
    member_id,
    resort_id,
    member_no,
    member_gname,
    member_fname,
    member_haddress,
    member_email,
    member_phone,
    member_date_joined,
    member_points,
    member_id_recby
) VALUES (
    1,
    1,
    4,
    'Krishna',
    'Manogaran',
    '3 Ancora Imparo Way',
    'krishna12345@gmail.com',
    '0123456789',
    to_date('02/10/2022', 'dd/mm,yyyy'),
    0,
    1
);

-- Insert member with non-existent resort id
INSERT INTO member (
    member_id,
    resort_id,
    member_no,
    member_gname,
    member_fname,
    member_haddress,
    member_email,
    member_phone,
    member_date_joined,
    member_points,
    member_id_recby
) VALUES (
    25,
    20,
    4,
    'Krishna',
    'Manogaran',
    '3 Ancora Imparo Way',
    'krishna12345@gmail.com',
    '0123456789',
    to_date('02/10/2022', 'dd/mm,yyyy'),
    0,
    1
);

-- Insert member with pre-existing number
INSERT INTO member (
    member_id,
    resort_id,
    member_no,
    member_gname,
    member_fname,
    member_haddress,
    member_email,
    member_phone,
    member_date_joined,
    member_points,
    member_id_recby
) VALUES (
    25,
    1,
    1,
    'Krishna',
    'Manogaran',
    '3 Ancora Imparo Way',
    'krishna12345@gmail.com',
    '0123456789',
    to_date('02/10/2022', 'dd/mm,yyyy'),
    0,
    1
);

-- Insert member that isn't recommended by another member within same resort
INSERT INTO member (
    member_id,
    resort_id,
    member_no,
    member_gname,
    member_fname,
    member_haddress,
    member_email,
    member_phone,
    member_date_joined,
    member_points,
    member_id_recby
) VALUES (
    25,
    1,
    4,
    'Krishna',
    'Manogaran',
    '3 Ancora Imparo Way',
    'krishna12345@gmail.com',
    '0123456789',
    to_date('02/10/2022', 'dd/mm,yyyy'),
    0,
    2
);

-- Insert member that is recommended by another member within same resort - success
INSERT INTO member (
    member_id,
    resort_id,
    member_no,
    member_gname,
    member_fname,
    member_haddress,
    member_email,
    member_phone,
    member_date_joined,
    member_points,
    member_id_recby
) VALUES (
    25,
    1,
    4,
    'Krishna',
    'Manogaran',
    '3 Ancora Imparo Way',
    'krishna12345@gmail.com',
    '0123456789',
    to_date('02/10/2022', 'dd/mm,yyyy'),
    0,
    1
);

SELECT * FROM member;

rollback;






