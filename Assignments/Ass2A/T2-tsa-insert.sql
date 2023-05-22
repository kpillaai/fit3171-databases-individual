/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-tsa-insert.sql

--Student ID:
--Student Name:
--Unit Code:
--Applied Class No:

/* Comments for your marker:




*/

---**This command shows the outputs of triggers**---
---**Run the command before running the insert statements.**---
---**Do not remove**---
SET SERVEROUTPUT ON
---**end**---

--------------------------------------
--INSERT INTO cabin
--------------------------------------
INSERT INTO cabin VALUES (
    1,          -- resort_id
    1,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    20,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    1,          -- resort_id
    2,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    30,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    1,          -- resort_id
    3,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    40,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    2,          -- resort_id
    1,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    30,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    2,          -- resort_id
    2,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    40,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    2,          -- resort_id
    3,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    50,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    3,          -- resort_id
    1,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    40,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    3,          -- resort_id
    2,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    50,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    3,          -- resort_id
    3,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    60,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    4,          -- resort_id
    1,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    50,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    4,          -- resort_id
    2,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    60,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    4,          -- resort_id
    3,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    70,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    5,          -- resort_id
    1,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    60,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    5,          -- resort_id
    2,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    70,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    5,          -- resort_id
    3,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    80,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    5,          -- resort_id
    4,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    90,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    6,          -- resort_id
    1,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    70,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    6,          -- resort_id
    2,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    80,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    6,          -- resort_id
    3,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    90,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    6,          -- resort_id
    4,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    100,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

--------------------------------------
--INSERT INTO booking
--------------------------------------
INSERT INTO booking VALUES (
    1,          --booking_id
    1,          --resort_id
    1,          --cabin_no
    TO_DATE('02/03/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('09/03/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    140,          --booking_total_points_cost
    1,          --member_id
    1           --staff_id
);

INSERT INTO booking VALUES (
    2,          --booking_id
    1,          --resort_id
    2,          --cabin_no
    TO_DATE('01/04/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('08/04/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    210,          --booking_total_points_cost
    1,          --member_id
    1           --staff_id
);

INSERT INTO booking VALUES (
    3,          --booking_id
    2,          --resort_id
    1,          --cabin_no
    TO_DATE('02/03/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('09/03/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    210,          --booking_total_points_cost
    2,          --member_id
    1           --staff_id
);

INSERT INTO booking VALUES (
    4,          --booking_id
    2,          --resort_id
    2,          --cabin_no
    TO_DATE('01/04/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('08/04/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    280,          --booking_total_points_cost
    2,          --member_id
    1           --staff_id
);

INSERT INTO booking VALUES (
    5,          --booking_id
    3,          --resort_id
    1,          --cabin_no
    TO_DATE('02/03/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('09/03/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    280,          --booking_total_points_cost
    3,          --member_id
    1           --staff_id
);

INSERT INTO booking VALUES (
    6,          --booking_id
    3,          --resort_id
    2,          --cabin_no
    TO_DATE('01/04/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('08/04/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    350,          --booking_total_points_cost
    3,          --member_id
    1           --staff_id
);

INSERT INTO booking VALUES (
    7,          --booking_id
    4,          --resort_id
    1,          --cabin_no
    TO_DATE('01/04/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('08/04/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    350,          --booking_total_points_cost
    4,          --member_id
    1           --staff_id
);

INSERT INTO booking VALUES (
    8,          --booking_id
    4,          --resort_id
    2,          --cabin_no
    TO_DATE('01/04/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('08/04/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    420,          --booking_total_points_cost
    5,          --member_id
    1           --staff_id
);

INSERT INTO booking VALUES (
    9,          --booking_id
    5,          --resort_id
    1,          --cabin_no
    TO_DATE('01/04/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('08/04/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    420,          --booking_total_points_cost
    6,          --member_id
    1           --staff_id
);

INSERT INTO booking VALUES (
    10,          --booking_id
    5,          --resort_id
    2,          --cabin_no
    TO_DATE('01/04/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('08/04/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    490,          --booking_total_points_cost
    7,          --member_id
    1           --staff_id
);
------------------
--SECOND BOOKINGS
------------------

INSERT INTO booking VALUES (
    11,          --booking_id   
    1,          --resort_id
    1,          --cabin_no
    TO_DATE('10/03/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('17/03/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    140,          --booking_total_points_cost
    8,          --member_id
    1           --staff_id
);

INSERT INTO booking VALUES (
    12,          --booking_id
    1,          --resort_id
    1,          --cabin_no
    TO_DATE('18/03/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('25/03/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    140,          --booking_total_points_cost
    9,          --member_id
    1           --staff_id
);

INSERT INTO booking VALUES (
    13,          --booking_id
    2,          --resort_id
    1,          --cabin_no
    TO_DATE('10/03/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('17/03/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    210,          --booking_total_points_cost
    10,          --member_id
    1           --staff_id
);

INSERT INTO booking VALUES (
    14,          --booking_id
    2,          --resort_id
    1,          --cabin_no
    TO_DATE('18/03/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('25/03/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    210,          --booking_total_points_cost
    11,          --member_id
    1           --staff_id
);

INSERT INTO booking VALUES (
    15,          --booking_id
    3,          --resort_id
    1,          --cabin_no
    TO_DATE('10/03/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('17/03/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    280,          --booking_total_points_cost
    12,          --member_id
    1           --staff_id
);

INSERT INTO booking VALUES (
    16,          --booking_id
    3,          --resort_id
    1,          --cabin_no
    TO_DATE('18/03/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('25/03/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    280,          --booking_total_points_cost
    13,          --member_id
    1           --staff_id
);

INSERT INTO booking VALUES (
    17,          --booking_id
    5,          --resort_id
    1,          --cabin_no
    TO_DATE('10/03/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('17/03/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    420,          --booking_total_points_cost
    14,          --member_id
    1           --staff_id
);

INSERT INTO booking VALUES (
    18,          --booking_id
    6,          --resort_id
    1,          --cabin_no
    TO_DATE('10/03/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('17/03/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    490,          --booking_total_points_cost
    15,          --member_id
    1           --staff_id
);

INSERT INTO booking VALUES (
    19,          --booking_id
    1,          --resort_id
    1,          --cabin_no
    TO_DATE('18/04/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('25/04/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    140,          --booking_total_points_cost
    16,          --member_id
    1           --staff_id
);

INSERT INTO booking VALUES (
    20,          --booking_id
    2,          --resort_id
    1,          --cabin_no
    TO_DATE('18/04/2023', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('25/04/2023', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    210,          --booking_total_points_cost
    17,          --member_id
    1           --staff_id
);








