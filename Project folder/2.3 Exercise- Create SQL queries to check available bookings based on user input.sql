USE LittleLemonDB;

-- Task 1: Populate Bookings table

INSERT INTO Bookings (BookingID, Date, TableNo, CustomerID)
VALUES 
(1, "2022-10-10", 5, 1),
(2, "2022-11-12", 3, 3),
(3, "2022-10-11", 2, 2),
(4, "2022-10-13", 2, 1);

SELECT * FROM Bookings;


-- Task 2: Create stored procedure CheckBooking

DELIMITER //
CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_no INT)
BEGIN
SELECT 
CASE
	WHEN TableNo = table_no AND Date = booking_date THEN CONCAT("Table ", table_no, " is already booked")
    ELSE CONCAT("Table ", table_no, " is not booked yet")
END AS "Booking Status"
FROM Bookings
WHERE Date = booking_date;
END //
DELIMITER ;

-- Test examples
CALL CheckBooking("2022-10-11", 2);
CALL CheckBooking("2022-10-11", 3);
CALL CheckBooking("2022-11-12", 3);


-- Task 3: Create procedure AddValidBooking

DELIMITER //
CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_no INT)

BEGIN
	DECLARE isBooked INT;
    DECLARE BookingStatus VARCHAR(255);
    
    START TRANSACTION;
    
    SELECT COUNT(*) INTO isBooked
    FROM bookings
    WHERE Date = booking_date AND TableNo = table_no;
    
    IF isBooked > 0 THEN
		SET @BookingStatus = CONCAT("Table ", table_no, " is already booked -- cancelled booking");
        SELECT @BookingStatus;
		ROLLBACK;
	ELSE
		INSERT INTO bookings(Date, TableNo) VALUES (booking_date, table_no);
        SET @BookingStatus = CONCAT("Table ", table_no, " is booked -- booking confirmed");
        SELECT @BookingStatus;
        COMMIT;
	END IF;
END //

DELIMITER ;

-- Test examples

CALL AddValidBooking("2022-12-17", 5);
CALL AddValidBooking("2022-10-13", 2);

SELECT * FROM bookings;




