--Comment out SET ECHO and SPOOL commands before submitting your portfolio
--SET ECHO ON
--SPOOL sql_portfolio1_output.txt

--****PLEASE ENTER YOUR DETAILS BELOW****
--sql_portfolio1.sql

--Student ID: 31500153
--Student Name: Krishna Pillaai Manogaran
--Unit Code: FIT3171
--Applied Class No:


/*Task 1: CREATE table POLICY and non FK constraints*/
CREATE TABLE policy (
    policy_id           NUMBER(7) NOT NULL,
    prop_no             NUMBER(4) NOT NULL,
    policy_startdate    DATE NOT NULL,
    policy_type_code    CHAR(1) NOT NULL,
    policy_length       NUMBER(3) NOT NULL,
    insurer_code        CHAR(3) NOT NULL
);
ALTER TABLE policy ADD CONSTRAINT policy_pk PRIMARY KEY (policy_id);
ALTER TABLE policy ADD CONSTRAINT policy_legnth_min_6_months CHECK (policy_length >= 6);

COMMENT ON COLUMN policy.policy_id IS 'Policy unique identifier';
COMMENT ON COLUMN policy.prop_no IS 'Property unique identifier';
COMMENT ON COLUMN policy.policy_startdate IS 'Policy start date';
COMMENT ON COLUMN policy.policy_type_code IS 'Policy type unique identifier';
COMMENT ON COLUMN policy.policy_length IS 'Length of the policy in months (minimum 6 months long)';
COMMENT ON COLUMN policy.insurer_code IS 'Insurance company unique identifier';


/*Task 1: Add FK constraints*/
ALTER TABLE policy
    ADD 
        (CONSTRAINT property_policy_fk FOREIGN KEY (prop_no) REFERENCES property (prop_no), 
        CONSTRAINT policy_type_policy_fk FOREIGN KEY (policy_type_code) REFERENCES policy_type (policy_type_code),
        CONSTRAINT insurer_policy_fk FOREIGN KEY (insurer_code) REFERENCES insurer (insurer_code),
        CONSTRAINT policy_uq UNIQUE (prop_no, policy_startdate, policy_type_code));
        


/*Task 2*/
INSERT INTO policy VALUES(policy_seq.nextval, 7145, to_date('21 Apr 2023', 'dd Mon yyyy'), 'B', 12, 'LAS');
INSERT INTO policy VALUES(policy_seq.nextval, 9346, to_date('21 Apr 2023', 'dd Mon yyyy'), 'B', 12, 'LAS');


/*Task 3*/
UPDATE policy SET policy_length = policy_length + 6 WHERE policy_id = 1;
INSERT INTO policy VALUES(policy_seq.nextval, 7145, to_date('01 May 2023', 'dd Mon yyyy'), 'C', 12, 'LAS');


/*Task 4*/
UPDATE policy SET policy_length = policy_length - 6 WHERE policy_id = 1;
DELETE FROM policy WHERE UPPER(policy_type_code) = 'C' and policy.prop_no = 7145;


--Comment out SET ECHO and SPOOL commands before submitting your portfolio
--SPOOL OFF
--SET ECHO OFF