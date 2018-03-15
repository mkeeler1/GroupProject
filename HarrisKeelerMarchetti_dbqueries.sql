/*TeamHarrisKeelerMarchetti */ 
/*Team Members: Lauren Harris, Melissa Keeler, Jonathan Marchetti */
USE CustomerFurnitureDb;
GO

SELECT *
FROM Product

SELECT *
FROM Store

SELECT *
FROM Sales

SELECT *
FROM Customer

/*Searching for the total store sales sum */
SELECT SUM(StoreSales) AS Total_Store_Sales
FROM Store

/*Searching for count of all orders for every customer */
SELECT c.LastName, COUNT(s.SaleID) AS Orders
FROM Customer AS c
INNER JOIN Sales AS s ON c.CustomerID = s.CustomerID
GROUP BY c.LastName

/*Searching for all product names that align with the customers who purchased them*/
SELECT p.ProductName, c.FirstName, c.LastName
FROM Product AS p
RIGHT JOIN Sales AS s ON p.ProductID = s.ProductID
RIGHT JOIN Customer AS c ON s.CustomerID = c.CustomerID
ORDER BY c.LastName

/*The outer join is necessary to see all the products ordered by each person, even though not all purchased a product */

/*Searching for the product names that are worth more than the average list price and the customers who purchased*/
SELECT p.ProductName, c.FirstName, c.LastName
FROM Product AS p
RIGHT JOIN Sales AS s ON p.ProductID = s.ProductID
RIGHT JOIN Customer AS c ON s.CustomerID = c.CustomerID
WHERE p.ListPrice >
	(SELECT AVG(p.ListPrice) AS AverageListPrice
	FROM Product AS p)
ORDER BY c.LastName
