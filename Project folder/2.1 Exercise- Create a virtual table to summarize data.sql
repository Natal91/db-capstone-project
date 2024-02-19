-- Task 1: Creating a view

USE LittleLemonDB;

CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost
FROM orders
WHERE Quantity > 2;

SELECT * FROM OrdersView;


-- Task 2: JOINing tables

SELECT customer.CustomerID, CONCAT(customer.FirstName, " ", customer.LastName) AS FullName,
orders.OrderID, orders.TotalCost AS Cost, menu.MenuName, 
menuitems.CourseName, menuitems.StarterName
FROM customer INNER JOIN orders ON customer.CustomerID = orders.CustomerID
INNER JOIN menu ON orders.MenuID = menu.MenuID
INNER JOIN menuitems ON menu.ItemID = menuitems.ItemID
WHERE orders.TotalCost > 150
ORDER BY orders.TotalCost;


-- Task 3: Subqueries

SELECT MenuName
FROM menu
WHERE MenuID = ANY (SELECT MenuID FROM orders WHERE Quantity > 2);

