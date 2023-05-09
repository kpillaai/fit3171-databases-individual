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
SELECT
    maint_id, maint_datetime, prop_address, owner_givname, owner_famname, maint_desc, maint_cost
FROM
    rent.property NATURAL JOIN rent.maintenance, rent.owner
WHERE
    maint_cost BETWEEN 1000 AND 3000 AND maint_assigned = 'Y'
ORDER BY
    maint_cost DESC, maint_datetime;

/*2*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
/*
SELECT 
    rent_agreement_no, tenant_no, tenant_title, tenant_givname, tenant_famname, prop_address, owner_givname, rent_lease_period
FROM
    (rent.rent JOIN rent.tenant ON rent.tenant_no = tenant.tenant_no) JOIN (rent.property JOIN rent.owner ON property.owner_no = owner.owner_no) ON property.prop_no = rent.prop_no
WHERE
    rent_weekly_rate < 425
ORDER BY
    tenant_no;
*/
/*3*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    tenant_no, tenant_title, tenant_givname, tenant_famname, dam_no, dam_cost
FROM
    rent.tenant, rent.damage
WHERE
    to_char(dam_datetime, 'dd-Mon-yyyy') LIKE '%2022'
ORDER BY
    dam_cost DESC, tenant_no;

/*4*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    tenant_no, tenant_title, tenant_givname, tenant_famname, prop_no, prop_address, COUNT(rent_agreement_no)
FROM
    rent.tenant, rent.property
WHERE
    UPPER(prop_address) LIKE '%TASMANIA'
ORDER BY
    tenant_no;

--Comment out SET ECHO and SPOOL commands before submitting your portfolio
SPOOL OFF
SET ECHO OFF