DECLARE
    input_string VARCHAR2(100);
    reversed_string VARCHAR2(100) := '';
    length_of_string NUMBER;
BEGIN
    input_string := '&Enter_String';

    length_of_string := LENGTH(input_string);

    FOR i IN REVERSE 1..length_of_string LOOP
        reversed_string := reversed_string || SUBSTR(input_string, i, 1);
    END LOOP;

    IF input_string = reversed_string THEN
        DBMS_OUTPUT.PUT_LINE(input_string || ' is a palindrome.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(input_string || ' is not a palindrome.');
    END IF;
END;
/
