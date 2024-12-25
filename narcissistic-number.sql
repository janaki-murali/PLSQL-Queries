DECLARE
    n NUMBER := &input_number;
    original_number NUMBER := n;
    digit_count NUMBER := 0;
    sum NUMBER := 0;
    digit NUMBER;
BEGIN
    digit_count := LENGTH(n);

    WHILE n > 0 LOOP
        digit := MOD(n, 10);
        sum := sum + POWER(digit, digit_count);
        n := TRUNC(n / 10);
    END LOOP;

    IF sum = original_number THEN
        DBMS_OUTPUT.PUT_LINE(original_number || ' is a Narcissistic number.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(original_number || ' is not a Narcissistic number.');
    END IF;
END;
/
