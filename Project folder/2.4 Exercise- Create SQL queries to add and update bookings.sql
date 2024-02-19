USE LittleLemonDB;

-- Task 1: Create Procedure AddBooking

DELIMITER //
CREATE PROCEDURE AddBooking(IN book_id INT, IN cust_id INT, IN table_no INT, IN book_date DATE)
BEGIN
DECLARE Confirmation VARCHAR(100);
INSERT INTO Bookings(BookingID, Date, TableNo, CustomerID) 
VALUES (book_id, book_date, table_no, cust_id);
SET Confirmation = "New booking added";
SELECT Confirmation;
END //
DELIMITER ;

CALL AddBooking(9, 3, 4, "2022-12-30");


-- Task 2: Create procedure UpdateBookings

DELIMITER //
CREATE PROCEDURE UpdateBooking(IN book_ID INT, IN book_date DATE)
BEGIN
DECLARE Confirmation VARCHAR(100);
UPDATE Bookings SET Date = book_date WHERE BookingID =  book_ID;
SET Confirmation = CONCAT("Booking ", book_ID, " is updated");
SELECT Confirmation;
END //
DELIMITER ;

CALL UpdateBooking(9, "2012-12-17");


-- Task 3: Create procedure CancelBooking

DELIMITER //
CREATE PROCEDURE CancelBooking (IN book_id INT)
BEGIN
DECLARE Confirmation VARCHAR(100);
DELETE FROM Bookings WHERE BookingID = book_id;
SET Confirmation = CONCAT("Booking ", book_id, " is cancelled");
SELECT Confirmation;
END //
DELIMITER ;

CALL CancelBooking(9);


