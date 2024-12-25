DECLARE
    n NUMBER := &n;
    first NUMBER := 0;
    second NUMBER := 1;
    next NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Fibonacci Series:');
    
    FOR i IN 1..n LOOP
        DBMS_OUTPUT.PUT_LINE(first);
        next := first + second;
        first := second;
        second := next;
    END LOOP;
END;
/
