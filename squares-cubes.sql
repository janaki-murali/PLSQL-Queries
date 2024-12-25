/*Write a PL/SQL program that reads a positive integer n, forms two seperate tables
namely SQUARE and CUBE containing the perfect squares upto (including) n and the
perfect cubes(including) n, print the contents of the two tables and then delete the two
tables.*/

BEGIN
        EXECUTE IMMEDIATE 'CREATE TABLE SQUARES (Numbers INT PRIMARY KEY)';
        EXECUTE IMMEDIATE 'CREATE TABLE CUBES (Numbers INT PRIMARY KEY)';
    END;
    /
    DECLARE
    n     NUMBER := &n;
    i     NUMBER;
    j     NUMBER;
    sqr   NUMBER;
    cbe   NUMBER;
    snum  NUMBER;
    cnum  NUMBER;

    CURSOR c_cursor IS SELECT Numbers FROM CUBES;
    CURSOR s_cursor IS SELECT Numbers FROM SQUARES;

    BEGIN
    FOR i IN 0 .. n LOOP
        sqr := 0;
        cbe := 0;

        FOR j IN 0 .. CEIL(SQRT(i)) LOOP
            IF j * j = i THEN
                sqr := 1;
            END IF;
            IF j * j * j = i THEN
                cbe := 1;
            END IF;
        END LOOP;

        IF sqr = 1 THEN
            EXECUTE IMMEDIATE 'INSERT INTO SQUARES VALUES (:1)' USING i;
        END IF;
        IF cbe = 1 THEN
            EXECUTE IMMEDIATE 'INSERT INTO CUBES VALUES (:1)' USING i;
        END IF;
    END LOOP;

    dbms_output.put_line('Square Numbers');
    OPEN s_cursor;
    LOOP
        FETCH s_cursor INTO snum;
        EXIT WHEN s_cursor%NOTFOUND;
        dbms_output.put_line(snum);
    END LOOP;
    CLOSE s_cursor;

    dbms_output.put_line('Cube Numbers');
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
        EXECUTE IMMEDIATE 'DROP TABLE SQUARES';
        EXECUTE IMMEDIATE 'DROP TABLE CUBES';
    END;
    /
