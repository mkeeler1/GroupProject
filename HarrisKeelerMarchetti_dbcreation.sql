/*TeamHarrisKeelerMarchetti */ 
/*Team Members: Lauren Harris, Melissa Keeler, Jonathan Marchetti */
CREATE DATABASE CustomerFurnitureDb;
GO

USE CustomerFurnitureDb;
GO

-- Create the tables
CREATE TABLE Product(
  ProductID bigint NOT NULL PRIMARY KEY,
  ProductName varchar(50) NOT NULL, 
  ListPrice bigint NOT NULL,
  ProductCategoryName varchar(50) NOT NULL);

CREATE TABLE Store(
  StoreID bigint NOT NULL PRIMARY KEY,
  StoreName varchar(50) NOT NULL,
  OwnerName varchar(50) NOT NULL,
  Address varchar(50) NOT NULL,
  StoreSales bigint NOT NULL);
 
CREATE TABLE Sales(
  SaleID bigint NOT NULL PRIMARY KEY,
  ProductID bigint NOT NULL,
  StoreID bigint NOT NULL,
  CustomerID bigint NOT NULL,
  Date varchar(50) NOT NULL);

CREATE TABLE Customer(
  CustomerID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Address varchar(50) NOT NULL,
  Gender varchar(50) NOT NULL);

  -- Create the relationship
ALTER TABLE Sales ADD CONSTRAINT FK_Sales_Product
FOREIGN KEY (ProductID) REFERENCES Product(ProductID);

ALTER TABLE Sales ADD CONSTRAINT FK_Sales_Store 
FOREIGN KEY (StoreId) REFERENCES Store(StoreID);

ALTER TABLE Sales ADD CONSTRAINT FK_Sales_Customer
FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerID);
GO

-- Add Values
INSERT INTO Product (ProductID, ProductName, ListPrice, ProductCategoryName) VALUES 
(1, '3_Door_Chestnut', 75, 'Cabinet'),
(2, 'Maple_Stool', 15, 'Chair'),
(3, '1_Drawer_White', 35, 'Cabinet'),
(4, 'Mahogany_Table', 100, 'Table'),
(5, 'Plastic_Folding_Chair', 7, 'Chair'),
(6, 'Picnic_Table', 21, 'Table'),
(7, 'Portable_Closet', 48, 'Storage'),
(8, 'Under_Bed_Shoe_Storage', 20, 'Storage'),
(9, '4_Drawer_Cherry', 80, 'Cabinet'),
(10, 'High_Back_Chair_Set', 450, 'Chair');

INSERT INTO Store (StoreID, StoreName, OwnerName, Address, StoreSales) VALUES 
(1, 'IKEA', 'Ross John', '32 Park Avenue', 40000000),
(2, 'Furniture_Local', 'Ivan Paul', '44 Wadsworth Street', 600000000),
(3, 'Furniture_Warehouse', 'George Bradley', '555 High Road', 35678000),
(4, 'Chairs_R_Us', 'Taylor Mosen', '938 Jacket Street', 203820934),
(5, 'Holly_Berry', 'Carol Jenkens', '22 Main Street', 43000),
(6, 'Target', 'Holly Oates', '23 Ocean Way', 3309492),
(7, 'Wilkins', 'John Wilkins', '903 Park Manor Road', 45894000),
(8, 'Ferns', 'Mike Glighty', '9 Messagener Street', 4000),
(9, 'Tiger Store', 'Erin Tigrin', '34 Tiger Way', 34000),
(10, 'Lenux', 'Harold Chang', '234 Poinsettia Drive', 5999);

INSERT INTO Sales (SaleID, ProductID, StoreID, CustomerID, Date) VALUES 
(1, 4, 5, 8, '07-30-17'),
(2, 10, 5, 8, '11-21-17'),
(3, 4, 6, 10, '09-03-17'),
(4, 8, 10, 9, '02-28-18'),
(5, 3, 7, 1, '01-14-18'),
(6, 4, 6, 10, '01-15-18'),
(7, 5, 9, 5, '12-17-17'),
(8, 2, 3, 7, '08-23-17'),
(9, 1, 7, 9, '10-25-17'),
(10, 9, 2, 1, '11-26-17');

INSERT INTO Customer (CustomerID, FirstName, LastName, Address, Gender) VALUES 
(1, 'Chris', 'Lowe', '23 Maritime Drive', 'Male'),
(2, 'Marion', 'Liber', '399 Hostel Street', 'Female'),
(3, 'Andre', 'Crew', '239 Lista Boulevard', 'Male'),
(4, 'Cara', 'Rippon', '11 Leftward Street', 'Female'),
(5, 'Mark', 'Marcus', '22 Sidewinder Boulevard', 'Male'),
(6, 'Sarah', 'Azure', '9 Witch Way', 'Female'),
(7, 'Lisa', 'Pole', '2330 Rock Street' , 'Female'),
(8, 'Fred', 'Cole', '101 Dalmatian Way', 'Male'),
(9, 'Cole', 'Tanner', '1991 Makanui Street' , 'Male'),
(10, 'Sarah', 'Kiskin', '2929 Perry Way', 'Female');



