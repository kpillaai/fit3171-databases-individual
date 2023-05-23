--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-tsa-alter.sql

--Student ID: 31500153
--Student Name: Krishna Pillaai Manogaran
--Unit Code: FIT3171
--Applied Class No: 3

/* Comments for your marker:




*/
DROP TABLE role CASCADE CONSTRAINTS PURGE;

DROP TABLE cleaning CASCADE CONSTRAINTS PURGE;

DROP TABLE cleaner CASCADE CONSTRAINTS PURGE;

--4(a)
SELECT * FROM cabin;
DESC cabin;

ALTER TABLE cabin ADD cabin_no_of_bookings NUMBER(2) DEFAULT 0;

UPDATE cabin SET cabin_no_of_bookings = (SELECT COUNT(*) FROM booking WHERE booking.resort_id = cabin.resort_id AND booking.cabin_no = cabin.cabin_no);

SELECT * FROM cabin;
DESC cabin;

--4(b)
SELECT * FROM staff;
DESC staff;

CREATE TABLE role (
    role_id                 CHAR(1),
    role_name               VARCHAR(30),
    role_job_description    VARCHAR(250)
);

COMMENT ON COLUMN role.role_id IS
    'Staff role identifier';
    
COMMENT ON COLUMN role.role_name IS
    'Staff role name';
    
COMMENT ON COLUMN role.role_job_description IS
    'Staff role description';

ALTER TABLE role ADD CONSTRAINT role_pk PRIMARY KEY (role_id);

INSERT INTO role (
    role_id,
    role_name,
    role_job_description
) VALUES (
    'A', 
    'Admin', 
    'Take bookings, and reply to customer inquiries'
);

INSERT INTO role (
    role_id,
    role_name,
    role_job_description
) VALUES (
    'C', 
    'Cleaning', 
    'Clean cabins and maintain resort''s public area'
);

INSERT INTO role (
    role_id,
    role_name,
    role_job_description
) VALUES (
    'M', 
    'Marketing', 
    'Prepare and present marketing ideas and deliverables'
);

ALTER TABLE staff ADD role_id CHAR(1) DEFAULT 'A';

ALTER TABLE staff
    ADD CONSTRAINT staff_role_fk FOREIGN KEY (role_id)
        REFERENCES role (role_id);
        
SELECT * FROM staff;
DESC staff;

--4(c)
CREATE TABLE cleaning(
    cleaning_id         NUMBER(5),
    resort_id           NUMBER(4),
    cabin_no            NUMBER(3),
    cleaning_date       DATE
);

COMMENT ON COLUMN cleaning.cleaning_id IS
    'Cleaning session unique identifier';
    
COMMENT ON COLUMN cleaning.resort_id IS
    'Resort identifier for this clean';

COMMENT ON COLUMN cleaning.cabin_no IS
    'Cabin number within the resort';
    
COMMENT ON COLUMN cleaning.cleaning_date IS
    'Date of cleaning';

ALTER TABLE cleaning ADD CONSTRAINT cleaning_pk PRIMARY KEY (cleaning_id);


CREATE TABLE cleaner(
    cleaning_id             NUMBER(5),
    staff_id                NUMBER(5),
    role_id                 CHAR(1),
    cleaner_starttime      DATE,
    cleaner_endtime        DATE
);

COMMENT ON COLUMN cleaner.cleaning_id IS
    'Cleaning session unique identifier';
    
COMMENT ON COLUMN cleaner.staff_id IS
    'Staff identifier';
    
COMMENT ON COLUMN cleaner.role_id IS
    'Staff role identifier';
    
COMMENT ON COLUMN cleaner.cleaner_starttime IS
    'Cleaner start time';

COMMENT ON COLUMN cleaner.cleaner_endtime IS
    'Cleaner end time';

ALTER TABLE cleaner ADD CONSTRAINT cleaner_pk PRIMARY KEY (cleaning_id, staff_id);

ALTER TABLE cleaner ADD CONSTRAINT cleaner_role_check CHECK (role_id = 'C');


ALTER TABLE cleaning
    ADD CONSTRAINT cleaner_cabin_fk FOREIGN KEY (resort_id, cabin_no)
        REFERENCES cabin (resort_id, cabin_no);

ALTER TABLE cleaner
    ADD CONSTRAINT cleaner_cleaning_fk FOREIGN KEY (cleaning_id)
        REFERENCES cleaning (cleaning_id);

ALTER TABLE cleaner
    ADD CONSTRAINT cleaner_staff_fk FOREIGN KEY (staff_id)
        REFERENCES staff (staff_id);

ALTER TABLE cleaner
    ADD CONSTRAINT cleaner_role_fk FOREIGN KEY (role_id)
        REFERENCES role (role_id);

DESC cleaning;
DESC cleaner;






