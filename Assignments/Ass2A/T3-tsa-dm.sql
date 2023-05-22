--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-tsa-dm.sql

--Student ID: 31500153
--Student Name: Krishna Pillaai Manogaran
--Unit Code: FIT3171
--Applied Class No: 3

/* Comments for your marker:




*/

---**This command shows the outputs of triggers**---
---**Run the command before running the insert statements.**---
---**Do not remove**---
SET SERVEROUTPUT ON
---**end**---

--3(a)
DROP SEQUENCE booking_seq;

CREATE SEQUENCE booking_seq
    START WITH 100 INCREMENT BY 10;
    
--3(b)
INSERT INTO cabin (
    resort_id,
    cabin_no,
    cabin_nobedrooms,
    cabin_sleeping_capacity,
    cabin_bathroom_type,
    cabin_points_cost_day,
    cabin_description
) VALUES (
    (
        SELECT resort_id 
        FROM resort 
        WHERE LOWER(resort.resort_name) = LOWER('Awesome Resort') 
        AND resort.town_id = (
                SELECT town_id 
                FROM town 
                WHERE town.town_lat = -17.9644 AND town.town_long = 122.2304)
    ),
    4,
    4,
    10,
    'I',
    220,
    '4 Bedroom 10 Person cabin'
);

--3(c)


--3(d)


--3(e)