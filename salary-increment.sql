/*The following table shows the salary information of employees in a company.
Employee(empid, empname, salary)
Write a trigger that causes insertion of a new entry into the table INCREMENT(empid,
incr), if the difference arising due to an updation of the salary of an existing employee is
greater than Rs. 1000/-.*/

CREATE TABLE emp (
    empid INT PRIMARY KEY,
    empname VARCHAR2(50),
    salary NUMBER
    );

    INSERT INTO emp VALUES (1, 'Amit Sharma', 45000);
    INSERT INTO emp VALUES (2, 'Priya Verma', 52000);
    INSERT INTO emp VALUES (3, 'Rahul Singh', 48000);
    INSERT INTO emp VALUES (4, 'Neha Gupta', 60000);
    INSERT INTO emp VALUES (5, 'Vikram Rao', 75000);

    CREATE TABLE incre (
    empid NUMBER,
    incr NUMBER,
    FOREIGN KEY (empid) REFERENCES emp(empid)
    );

    CREATE OR REPLACE TRIGGER incre_trigger
    AFTER UPDATE OF salary ON emp
    FOR EACH ROW
    BEGIN
    IF abs(:NEW.salary - :OLD.salary) > 1000 THEN
        INSERT INTO incre (empid, incr)
        VALUES (:NEW.empid, :NEW.salary - :OLD.salary);
    END IF;
    END;
    /

    UPDATE emp SET salary = 54000 WHERE empid = 2;
    UPDATE emp SET salary = 62000 WHERE empid = 4;

    SELECT * FROM incre;

     DROP TABLE incre;
     DROP TABLE emp;
