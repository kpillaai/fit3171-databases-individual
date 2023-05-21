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
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    1,          -- resort_id
    2,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    1,          -- resort_id
    3,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    2,          -- resort_id
    1,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    2,          -- resort_id
    2,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    2,          -- resort_id
    3,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    3,          -- resort_id
    1,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    3,          -- resort_id
    2,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    3,          -- resort_id
    3,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    4,          -- resort_id
    1,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    4,          -- resort_id
    2,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    4,          -- resort_id
    3,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    5,          -- resort_id
    1,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    5,          -- resort_id
    2,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    5,          -- resort_id
    3,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    5,          -- resort_id
    4,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    6,          -- resort_id
    1,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    6,          -- resort_id
    2,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    6,          -- resort_id
    3,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

INSERT INTO cabin VALUES (
    6,          -- resort_id
    4,          -- cabin_no
    2,          --cabin_nobedrooms
    5,          --cabin_sleeping_capacity      
    'I',        --cabin_bathroom_type
    1,          --cabin_ppoints_cost_day
    'Single person cabin'           --cabin_description
);

--------------------------------------
--INSERT INTO booking
--------------------------------------
INSERT INTO booking VALUES (
    1,          --booking_id
    1,          --resort_id
    1,          --cabin_no
    TO_DATE('10/09/2022', 'dd/mm/yyyy'),        --booking_from
    TO_DATE('10/09/2022', 'dd/mm/yyyy'),        --booking_to
    1,          --booking_noadults
    1,          --booking_nochildren
    1,          --booking_total_points_cost
    1,          --member_id
    1           --staff_id
);











