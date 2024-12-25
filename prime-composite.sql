/*Write a PL/SQL program that reads a positive integer n, forms two seperate tables
namely PRIME and COMPOSITE containing the first n prime numbers and the first n
composite numbers, print the contents of the two tables and then delete the two tables.*/

BEGIN
        EXECUTE IMMEDIATE 'CREATE TABLE PRIME (Numbers INT PRIMARY KEY)';
        EXECUTE IMMEDIATE 'CREATE TABLE COMPOSITE (Numbers INT PRIMARY KEY)';
    END;
    /
    DECLARE
    n     NUMBER := &n;
    i     NUMBER;
    j     NUMBER;
    p     NUMBER;
    pnum  NUMBER;
    cnum  NUMBER;

    CURSOR c_cursor IS SELECT Numbers FROM COMPOSITE;
    CURSOR p_cursor IS SELECT Numbers FROM PRIME;

    BEGIN
    FOR i IN 2 .. n LOOP
        p := 1;
        FOR j IN 2 .. FLOOR(i / 2) LOOP
            IF MOD(i, j) = 0 THEN
                p := 0;
                EXIT;
            END IF;
        END LOOP;

        IF p = 1 THEN
            EXECUTE IMMEDIATE 'INSERT INTO PRIME VALUES (:1)' USING i;
        ELSE
            EXECUTE IMMEDIATE 'INSERT INTO COMPOSITE VALUES (:1)' USING i;
        END IF;
    END LOOP;

    dbms_output.put_line('Prime Numbers');
    OPEN p_cursor;
    LOOP
        FETCH p_cursor INTO pnum;
        EXIT WHEN p_cursor%NOTFOUND;
        dbms_output.put_line(pnum);
    END LOOP;
    CLOSE p_cursor;

    dbms_output.put_line('Composite Numbers');
    OPEN c_cursor;
    LOOP
        FETCH c_cursor INTO cnum;
        EXIT WHEN c_cursor%NOTFOUND;
        dbms_output.put_line(cnum);
    END LOOP;
    CLOSE c_cursor;
    END;
    /
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE PRIME';
        EXECUTE IMMEDIATE 'DROP TABLE COMPOSITE';
    END;
    /
