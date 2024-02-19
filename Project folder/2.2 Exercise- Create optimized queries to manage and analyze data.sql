USE LittleLemonDB;

-- Task 1: Create procedure MaxQuantity

CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(Quantity) AS 'Max Quantity in Orders' FROM Orders;

CALL GetMaxQuantity();


-- Task 2: Create prepared statement OrderDetail

PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, TotalCost AS Cost FROM Orders WHERE OrderID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;


-- Task 3: Create procedure CancelOrder

CREATE TABLE Actions (ActionID INT NOT NULL AUTO_INCREMENT, Confirmation VARCHAR(255), PRIMARY KEY (ActionID));

DELIMITER //

CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
DELETE FROM Orders WHERE OrderID = order_id;
INSERT INTO Actions(Confirmation) VALUES (CONCAT("Order ", order_id, " is cancelled"));
SELECT * FROM Actions;
END //

DELIMITER ;





 

