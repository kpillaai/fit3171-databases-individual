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

COMMIT;

--3(c)
INSERT INTO booking (
    booking_id,
    resort_id,
    cabin_no,
    booking_from,
    booking_to,
    booking_noadults,
    booking_nochildren,
    booking_total_points_cost,
    member_id,
    staff_id
) VALUES (
    booking_seq.NEXTVAL,
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
    TO_DATE('26/05/2023', 'dd/mm/yyyy'),
    TO_DATE('28/05/2023', 'dd/mm/yyyy'),
    4,
    4,
    (SELECT cabin_points_cost_day FROM cabin WHERE cabin.resort_id = (
        SELECT resort_id 
        FROM resort 
        WHERE LOWER(resort.resort_name) = LOWER('Awesome Resort') 
        AND resort.town_id = (
                SELECT town_id 
                FROM town 
                WHERE town.town_lat = -17.9644 AND town.town_long = 122.2304)
    ) AND cabin.cabin_no = 4) * (TO_DATE('28/05/2023', 'dd/mm/yyyy') - TO_DATE('26/05/2023', 'dd/mm/yyyy')),
    (SELECT member_id FROM member WHERE member.member_no = 2 AND member.resort_id = 9),
    (SELECT staff_id FROM staff WHERE staff.staff_phone = '0493427245')
);

COMMIT;

--3(d)
UPDATE booking 
SET booking_to = TO_DATE('29/05/2023', 'dd/mm/yyyy') 
WHERE booking.resort_id = (
        SELECT resort_id 
        FROM resort 
        WHERE LOWER(resort.resort_name) = LOWER('Awesome Resort') 
        AND resort.town_id = (
                SELECT town_id 
                FROM town 
                WHERE town.town_lat = -17.9644 AND town.town_long = 122.2304)
    ) 
AND booking.cabin_no = 4 
AND booking_from = TO_DATE('26/05/2023', 'dd/mm/yyyy');

--3(e)
DELETE FROM booking WHERE booking.resort_id = (
        SELECT resort_id 
        FROM resort 
        WHERE LOWER(resort.resort_name) = LOWER('Awesome Resort') 
        AND resort.town_id = (
                SELECT town_id 
                FROM town 
                WHERE town.town_lat = -17.9644 AND town.town_long = 122.2304)
    ) AND booking.cabin_no = 4;
    
DELETE FROM cabin WHERE cabin.resort_id = (
        SELECT resort_id 
        FROM resort 
        WHERE LOWER(resort.resort_name) = LOWER('Awesome Resort') 
        AND resort.town_id = (
                SELECT town_id 
                FROM town 
                WHERE town.town_lat = -17.9644 AND town.town_long = 122.2304)
    ) AND cabin.cabin_no = 4;
    
COMMIT;

