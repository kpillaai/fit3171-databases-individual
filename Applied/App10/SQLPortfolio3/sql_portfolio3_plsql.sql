--Comment out SET ECHO, SET SERVEROUTPUT and SPOOL commands before submitting your portfolio
--SET ECHO ON
--SET SERVEROUTPUT ON
--SPOOL sql_portfolio3_plsql_output.txt

--****PLEASE ENTER YOUR DETAILS BELOW****
--sql_portfolio3_plsql.sql

--Student ID: 31500153
--Student Name: Krishna Pillaai Manogaran
--Unit Code: FIT3171
--Applied Class No: 3

-- PLEASE PLACE REQUIRED TRIGGER STATEMENT HERE
-- ENSURE your trigger ends with a line break, then a slash (/) then another line break

create or replace trigger policy_check_trigger
before insert on policy
for each row
declare
    prop_furnished_id   property.prop_fully_furnished%type;
    policy_enddate_id   DATE;
    policy_counter        NUMBER;
begin
    select prop_fully_furnished into prop_furnished_id
    from property
    where prop_no = :new.prop_no;
    
    if :new.policy_type_code = 'C' and prop_furnished_id = 'N' then
        raise_application_error(-20000, 'Property must be fully furnished to buy Contents policy');
    end if;
    /*
    select policy_enddate into policy_enddate_id
    from policy
    where prop_no = :new.prop_no and policy_type_code = :new.policy_type_code
    order by policy_enddate desc;
    
    select count(*)
    into policy_counter
    from policy
    where prop_no = :new.prop_no and policy_type_code = :new.policy_type_code
    order by policy_enddate desc;
    */
    if policy_enddate_id < :new.policy_startdate and policy_counter > 0 then
        raise_application_error(-20001, 'Start date must be after previous end date');
    end if;
    
end;
/


-- PLACE REQUIRED TRIGGER TEST HARNESS HERE
-- before value
select * from policy;

-- text for insert
insert into policy (
    policy_id,
    prop_no,
    policy_startdate,
    policy_type_code,
    policy_enddate,
    insurer_code
) values (
    policy_seq.nextval, 
    1965, 
    to_date('11/JAN/2022', 'dd/MON/yyyy'), 
    'C', 
    to_date('12/JAN/2022', 'dd/MON/yyyy'), 
    'LAS'
);

--after value
select * from policy;

-- test for insert (should raise error)
insert into policy (
    policy_id,
    prop_no,
    policy_startdate,
    policy_type_code,
    policy_enddate,
    insurer_code
) values (
    policy_seq.nextval, 
    5990, 
    to_date('11/JAN/2022', 'dd/MON/yyyy'), 
    'C', 
    to_date('12/JAN/2022', 'dd/MON/yyyy'), 
    'LAS'
);

--after value
select * from policy;

-- delete
delete from policy where prop_no = 1965;

-- after value
select * from policy;

-- closes transaction
rollback;

--End of Testing Harness


--Comment out SET ECHO, SET SERVEROUTPUT and SPOOL commands before submitting your portfolio
--SPOOL OFF
--SET ECHO OFF