--Comment out SET ECHO and SPOOL commands before submitting your portfolio
SET ECHO ON
SPOOL sql_portfolio2_basic_intermediate_output.txt

--****PLEASE ENTER YOUR DETAILS BELOW****
--sql_portfolio2_basic_intermediate.sql

--Student ID: 31500153
--Student Name: Krishna Pillaai Manogaran
--Unit Code: FIT3171
--Applied Class No: 3


/*1*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
-- HOW TO PUT OWNER NAME TOGETHER
-- MAINTANENCE DATE AND TIME
/*
SELECT
    maint_id, maint_datetime, prop_address, owner_givname, owner_famname, maint_desc, maint_cost
FROM
    rent.property NATURAL JOIN rent.maintenance, rent.owner
WHERE
    maint_cost BETWEEN 1000 AND 3000 AND maint_assigned = 'Y'
ORDER BY
    maint_cost DESC, maint_datetime;
*/
/*2*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT 
    rent_agreement_no, tenant_no, tenant_title, tenant_givname, tenant_famname, prop_address, owner_givname, rent_lease_period
FROM
    rent.tenant t JOIN rent.rent r ON t.tenant_no = r.tenant_no JOIN rent.property p ON r.prop_no = p.prop_no JOIN rent.owner o ON p.owner_no = o.owner_no
WHERE
    rent_weekly_rate < 425 AND to_char(rent_lease_start, 'YYYY') = '2022'
ORDER BY
    rent_lease_period, tenant_no;

/*3*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
/*
SELECT
    tenant_no, tenant_title, tenant_givname, tenant_famname, COUNT(dam_no) AS no_of_damages, dam_cost
FROM
    rent.tenant, rent.damage
WHERE
    to_char(dam_datetime, 'YYYY') = '2022'
ORDER BY
    dam_cost DESC, tenant_no;
*/
/*4*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
/*
SELECT
    tenant_no, tenant_title, tenant_givname, tenant_famname, prop_no, prop_address, COUNT(rent_agreement_no)
FROM
    rent.tenant, rent.property
WHERE
    UPPER(prop_address) LIKE '%TASMANIA'
ORDER BY
    tenant_no;
*/
--Comment out SET ECHO and SPOOL commands before submitting your portfolio
SPOOL OFF
SET ECHO OFF