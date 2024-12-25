/*The following table shows the details of the books available in a library.
Book(Accno, Title, Author, Publisher, Eition, Number of copies)
Write a trigger that displays the total number of tuples in the table on each insertion,
deletion and updation.*/

  SET SERVEROUTPUT ON;

    CREATE TABLE books (
    AccountNo INT PRIMARY KEY,
    title VARCHAR2(50),
    publisher VARCHAR2(50),
    author VARCHAR2(50),
    editions NUMBER,
    NumberOfCopies NUMBER
    );

    INSERT INTO books VALUES (1, 'Harry Potter and the Goblet of Fire',
    'Bloomsbury', 'J.K. Rowling', 1, 10);
    INSERT INTO books VALUES (2, 'Chaos Walking', 'Walker Books', 
    'Patrick Ness', 1, 5);
    INSERT INTO books VALUES (3, 'The Immortals of Meluha', 
    'Westland Publications', 'Amish Tripathi', 1, 7);

    CREATE OR REPLACE TRIGGER book_trigger
    AFTER INSERT OR UPDATE OR DELETE ON books
    DECLARE
        total_rows NUMBER;
    BEGIN
    SELECT COUNT(*) INTO total_rows FROM books;
    DBMS_OUTPUT.PUT_LINE('Total number of rows after operation: ' || total_rows);
    END;
    /

    INSERT INTO books VALUES (4, 'The Alchemist', 'HarperCollins', 
    'Paulo Coelho', 1, 12);

    UPDATE books SET NumberOfCopies = 15 WHERE AccountNo = 1;

    DELETE FROM books WHERE AccountNo = 3;

    DROP TABLE books;
