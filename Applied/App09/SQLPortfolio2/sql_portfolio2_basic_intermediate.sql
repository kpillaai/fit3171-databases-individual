--Comment out SET ECHO and SPOOL commands before submitting your portfolio
--SET ECHO ON
--SPOOL sql_portfolio2_basic_intermediate_output.txt

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

SELECT
    maint_id, to_char(maint_datetime, 'dd-Mon-yyyy hh:mi:ss AM') as maint_date_and_time, prop_address, owner_givname||' '||owner_famname as Owner_Fullname, maint_desc, maint_cost
FROM
    rent.property NATURAL JOIN rent.maintenance NATURAL JOIN rent.owner
WHERE
    maint_cost BETWEEN 1000 AND 3000 AND UPPER(maint_assigned) = UPPER('Y')
ORDER BY
    maint_cost DESC, maint_datetime DESC;

/*2*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT 
    r.rent_agreement_no, t.tenant_no, t.tenant_title||' '||t.tenant_givname||' '||tenant_famname as Tenant_Fullname, p.prop_address, o.owner_givname||' '||o.owner_famname as Owner_Fullname, CONCAT(r.rent_lease_period, ' months') as rent_lease_period
FROM
    rent.tenant t JOIN rent.rent r ON t.tenant_no = r.tenant_no JOIN rent.property p ON r.prop_no = p.prop_no JOIN rent.owner o ON p.owner_no = o.owner_no
WHERE
    rent_weekly_rate < 425 AND to_char(rent_lease_start, 'YYYY') = '2022' AND rent_lease_period >= 6
ORDER BY
    rent_lease_period DESC, tenant_no DESC;

/*3*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    t.tenant_no, t.tenant_title||' '||t.tenant_givname||' '||t.tenant_famname as tenant_name, COUNT(dam_no) as no_of_damages, CONCAT('$', to_char(dam_cost, '9999.99')) as total_dam_cost
FROM
    rent.tenant t JOIN rent.rent r ON t.tenant_no = r.tenant_no JOIN rent.damage d ON r.rent_agreement_no = d.rent_agreement_no
WHERE
    to_char(dam_datetime, 'YYYY') = '2022'
GROUP BY
    t.tenant_no, t.tenant_title, t.tenant_givname, t.tenant_famname, d.dam_cost
ORDER BY
    dam_cost DESC, tenant_no;

/*4*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    t.tenant_no, t.tenant_title||' '||t.tenant_givname||' '||t.tenant_famname as tenant_fullname, p.prop_no, p.prop_address, COUNT(rent_agreement_no) as no_of_rentals
FROM
    rent.tenant t JOIN rent.rent r ON t.tenant_no = r.tenant_no JOIN rent.property p ON p.prop_no = r.prop_no
WHERE
    UPPER(prop_address) LIKE '%TASMANIA'
GROUP BY
    t.tenant_no, t.tenant_title, t.tenant_givname, t.tenant_famname, p.prop_no, p.prop_address
ORDER BY
    tenant_no;

--Comment out SET ECHO and SPOOL commands before submitting your portfolio
--SPOOL OFF
--SET ECHO OFF