/*Given the schema Employee (empid, empname, joining date, relieving date, salary)
(a) Find the service (in years) for each relieved employee.
(b) Find the Pension amount to be paid to each relieved employee. (Pension is equal to
the years of service *salary divided by 100.
Use cursors.*/
  
  SET SERVEROUTPUT ON

    CREATE TABLE Employee (
    empid NUMBER PRIMARY KEY,
    empname VARCHAR2(50),
    joining_date DATE,
    relieving_date DATE,
    salary NUMBER
    );

    INSERT INTO Employee VALUES (1, 'Aarav', TO_DATE('2015-01-15', 'YYYY-MM-DD'),
    TO_DATE('2020-01-15', 'YYYY-MM-DD'), 50000);
    INSERT INTO Employee VALUES (2, 'Vivaan', TO_DATE('2016-03-10', 'YYYY-MM-DD'),
    TO_DATE('2021-03-10', 'YYYY-MM-DD'), 60000);
    INSERT INTO Employee VALUES (3, 'Aditya', TO_DATE('2017-06-20', 'YYYY-MM-DD'),
    TO_DATE('2022-06-20', 'YYYY-MM-DD'), 55000);
    INSERT INTO Employee VALUES (4, 'Diya', TO_DATE('2018-09-01', 'YYYY-MM-DD'),
    NULL, 65000);

    DECLARE
    CURSOR c1 IS
        SELECT empid, empname, joining_date, relieving_date, salary
        FROM Employee
        WHERE relieving_date IS NOT NULL;

    vempid Employee.empid%TYPE;
    vempname Employee.empname%TYPE;
    vjoining_date Employee.joining_date%TYPE;
    vrelieving_date Employee.relieving_date%TYPE;
    vsalary Employee.salary%TYPE;
    vservice_years NUMBER;
    vpension_amount NUMBER;
    BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO vempid, vempname, vjoining_date, vrelieving_date, vsalary;
        EXIT WHEN c1%NOTFOUND;

        vservice_years := FLOOR(MONTHS_BETWEEN(vrelieving_date, vjoining_date) / 12);
        vpension_amount := (vservice_years * vsalary) / 100;

        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || vempid);
        DBMS_OUTPUT.PUT_LINE('Employee Name: ' || vempname);
        DBMS_OUTPUT.PUT_LINE('Service (Years): ' || vservice_years);
        DBMS_OUTPUT.PUT_LINE('Pension Amount: ' || vpension_amount);
    END LOOP;
    CLOSE c1;
    END;
    /

    DROP TABLE Employee;
