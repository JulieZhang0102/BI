-- Team Name: YZZ Team Members:Qifei Yuan, Jiashu Zhang, Chenyu Zou
CREATE DATABASE McDonalds;
GO

USE McDonalds;
GO

-- Create the Supplier table
CREATE TABLE Supplier(
  SupplierID bigint NOT NULL PRIMARY KEY,
  SupplierName varchar(50) NOT NULL,
  State varchar(50) NOT NULL,
  City varchar(50) NOT NULL,
  ContactName varchar(50) NOT NULL,
  ContactPhone varchar(50) NOT NULL);
-- Create the Employee table
CREATE TABLE Employee(
  EmployeeID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  JobTitle varchar(50) NOT NULL,
  Gender varchar(50) NOT NULL,
  StoreID bigint NULL);
-- Create the Store table
CREATE TABLE Store(
  StoreID bigint NOT NULL PRIMARY KEY,
  State varchar(50) NOT NULL,
  City varchar(50) NOT NULL,
  MenuKey bigint NOT NULL);
  -- Create the Transaction table
CREATE TABLE Transactions(
  TransactionID bigint NOT NULL PRIMARY KEY,
  Date date NOT NULL,
  TotalAmount bigint NOT NULL,
  StoreID bigint NOT NULL);
   -- Create the TransactionItem table
CREATE TABLE TransactionItem(
  TransactionItemID bigint NOT NULL PRIMARY KEY,
  TransactionID bigint NOT NULL,
  ItemID bigint NOT NULL);
    -- Create the Item table
CREATE TABLE Item(
  ItemID bigint NOT NULL PRIMARY KEY,
  Name varchar(50) NOT NULL,
  Price bigint NOT NULL,
  MenuKey bigint NOT NULL);
   -- Create the Menu table
CREATE TABLE Menu(
  MenuKey bigint NOT NULL PRIMARY KEY);
  -- Create the Recipe table
CREATE TABLE Recipe(
  RecipeID bigint NOT NULL PRIMARY KEY,
  ItemID bigint NOT NULL,
  IngredientID bigint NOT NULL,
  IngredientAmount bigint NOT NULL);
    -- Create the Ingredient table
CREATE TABLE Ingredient(
  IngredientID bigint NOT NULL PRIMARY KEY,
  MeasurementUnit bigint NOT NULL);
-- Create the WhoSupplies table
CREATE TABLE WhoSupplies(
  WhoSuppliesID bigint NOT NULL PRIMARY KEY,
  SupplierID bigint NOT NULL,
  IngredientID bigint NOT NULL);

  -- Create the relationship for Employee Table and Store
ALTER TABLE Employee ADD CONSTRAINT FK_Employee_Store 
FOREIGN KEY (StoreID) REFERENCES Store(StoreID);
GO

  -- Create the relationship for Employee Table and Store
ALTER TABLE Employee ADD CONSTRAINT FK_Employee_Store 
FOREIGN KEY (StoreID) REFERENCES Store(StoreID);
GO

  -- Create the relationship for Store Table and Menu
ALTER TABLE Store ADD CONSTRAINT FK_Store_Menu 
FOREIGN KEY (MenuKey) REFERENCES Menu(MenuKey);
GO

  -- Create the relationship for Store Table and Transactions
ALTER TABLE Transactions ADD CONSTRAINT FK_Store_Transaction 
FOREIGN KEY (StoreID) REFERENCES Store(StoreID);
GO

  -- Create the relationship for Transactions Table and TransactionItem
ALTER TABLE TransactionItem ADD CONSTRAINT FK_Transactions_TransactionItem 
FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID);
GO
  -- Create the relationship for TransactionItem Table and Item
ALTER TABLE TransactionItem ADD CONSTRAINT FK_TransactionItem_Item 
FOREIGN KEY (ItemID) REFERENCES Item(ItemID);
GO
-- We will use designer view to create another relationship: the second FK in TransactionItem

-- Create the relationship for Menu Table and Item
ALTER TABLE Item ADD CONSTRAINT FK_Menu_Item 
FOREIGN KEY (MenuKey) REFERENCES Menu(MenuKey);
GO
-- Create the relationship for Recipe Table and Item
ALTER TABLE Recipe ADD CONSTRAINT FK_Recipe_Item 
FOREIGN KEY (ItemID) REFERENCES Item(ItemID);
GO
-- Create the relationship for Recipe Table and Ingredient
ALTER TABLE Recipe ADD CONSTRAINT FK_Recipe_Ingredient 
FOREIGN KEY (IngredientID) REFERENCES Ingredient(IngredientID);
GO
-- Create the relationship for WhoSupplies Table and Ingredient
ALTER TABLE WhoSupplies ADD CONSTRAINT FK_WhoSupplies_Ingredient 
FOREIGN KEY (IngredientID) REFERENCES Ingredient(IngredientID);
GO
-- Create the relationship for WhoSupplies Table and Supplier
ALTER TABLE WhoSupplies ADD CONSTRAINT FK_WhoSupplies_Supplier 
FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID);
GO
-- We will use designer view to create another relationship: the second FK in WhoSupplies

-- Add a few Suppliers
INSERT INTO Supplier (SupplierID, SupplierName, State, City, ContactName, ContactPhone) VALUES 
(1, 'Yinmeng Inc.', 'CA','San Jose','Apple','123456781'),
(2, 'Samuel Inc.', 'MA','Boston','Banana','123456782'),
(3, 'Anthony Inc.', 'NY','Manhattan','Chocolate','123456783'),
(4, 'Christian Inc.', 'MA','Wellesley','Dan','123456784'),
(5, 'Sang Won Inc.', 'TX','Austin','Mike','123456785'),
(6, 'Matthew Inc.', 'IL','Chicago','Sam','123456786'),
(7, 'Jonathan Inc.', 'CA','Paloalt','Amy','123456787'),
(8, 'Edward Inc.', 'NJ','Newark','John','123456788'),
(9, 'Patrick Inc.', 'NY','Flushing','Peter','123456789'),
(10, 'Emma Inc.', 'NC','Durham','Jack','123456780');
GO


-- Add a few Employees
INSERT INTO Employee(EmployeeID, FirstName,LastName, JobTitle, Gender, StoreID) VALUES 
(1, 'Jiashu', 'Zhang','Cashier','F', 1),
(2, 'May', 'Liu','Mananger','F', 2),
(3, 'Julie', 'Zhang','Cleaner','F', 3),
(4, 'Freda', 'Yuan','Chef','F', 4),
(5, 'Catherine', 'Wang','Cashier','M', 5),
(6, 'Sarah', 'Zhou','Manager','M', 6),
(7, 'Jeffery', 'Sun','Cleaner','M', 7),
(8, 'San', 'Jiang','Chef','M', 8),
(9, 'Kevin', 'Li','Cashier','F', 9),
(10, 'Simon', 'Zhu','Cahsier','M', 10);
GO

-- Add a few WhoSupplies
INSERT INTO WhoSupplies(WhoSuppliesID, SupplierID, IngredientID) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);
GO

-- Add a few Stores
INSERT INTO Store(StoreID, State, City, MenuKey) VALUES 
(1, 'CA','San Jose',1),
(2, 'MA','Boston',1),
(3, 'NY','Manhattan',1),
(4, 'MA','Wellesley', 1),
(5, 'TX','Austin', 1),
(6, 'IL','Chicago', 1),
(7, 'CA','Paloalt', 1),
(8, 'NJ','Newark', 1),
(9, 'NY','Flushing', 1),
(10,'NC','Durham', 1);
GO

-- Add a few Ingredients
INSERT INTO Ingredient(IngredientID, MeasurementUnit) VALUES 
(1, 5),
(2, 6),
(3, 7),
(4, 8),
(5, 9),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1);
GO

-- Add a few Transactions
INSERT INTO Transactions(TransactionID, Date, TotalAmount, StoreID) VALUES 
(1, '2018-01-02', 8, 1),
(2, '2018-02-06', 14,2),
(3, '2018-04-15', 16,3),
(4, '2018-09-10', 18,4),
(5, '2018-08-20', 10,5),
(6, '2018-11-30', 11,6),
(7, '2018-12-25', 22,7),
(8, '2018-07-18', 22,8),
(9, '2018-06-19', 20,9),
(10, '2018-10-10', 18,10),
(11, '2018-10-12', 8, 1),
(12, '2018-12-08', 14,2),
(13, '2018-04-18', 16,3),
(14, '2018-09-10', 18,4),
(15, '2018-08-20', 10,5),
(16, '2018-11-30', 11,6),
(17, '2018-12-25', 22,7),
(18, '2018-07-18', 22,8),
(19, '2018-06-19', 20,9),
(20, '2018-10-10', 18,10);
GO

-- Add a few Recipes
INSERT INTO Recipe(RecipeID, ItemID, IngredientID, IngredientAmount) VALUES 
(1, 1, 1, 5),
(2, 2, 2, 9),
(3, 3, 3, 8),
(4, 4, 4, 2),
(5, 5, 5, 4),
(6, 6, 6, 9),
(7, 7, 7, 10),
(8, 8, 8, 15),
(9, 9, 9, 19),
(10, 10, 10, 11);
GO

-- Add a few Items
INSERT INTO Item(ItemID, Name, Price, MenuKey) VALUES 
(1, 'Double Cheese Burger', 8, 1),
(2, 'Cheese Burger', 5, 1),
(3, 'Big Mac', 10, 1),
(4, 'Grilled Artisan Chicken', 11, 1),
(5, 'Egg McMuffin', 5, 1),
(6, 'Grilled Artisan Chicken', 10, 1),
(7, 'McChicken', 9, 1),
(8, 'Buttermilk Crispy Chicken', 7, 1),
(9, 'Hamburger', 4, 1),
(10, 'McDouble', 5, 1);
GO

-- Add a few Menu
INSERT INTO Menu(MenuKey) VALUES 
(1);
GO

-- Add a few TransactionItems
INSERT INTO TransactionItem(TransactionItemID, TransactionID, ItemID) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);
GO

--Add more stores
INSERT INTO Store(StoreID, State, City, MenuKey) VALUES
(11, 'CA','San Francisco',1),
(12, 'MA','Newton',1),
(13, 'CA','Los Angeles',1),
(14, 'MA','Waltham', 1),
(15, 'TX','Dallas', 1),
(16, 'IL','Moline', 1),
(17, 'CT','Hartford', 1),
(18, 'NJ','Paterson', 1),
(19, 'NY','Buffalo', 1),
(20,'MA','Needham', 1);
GO

--Add more employees
INSERT INTO Employee(EmployeeID, FirstName,LastName, JobTitle, Gender, StoreID) VALUES 
(11, 'Fangyu', 'Liu','Cashier','F', NULL),
(12, 'Frank', 'Jiang','Mananger','F', NULL),
(13, 'Rachel', 'Song','Cleaner','F', NULL),
(14, 'Coco', 'Bai','Chef','F', NULL),
(15, 'Yanchuan', 'Cai','Cashier','M', NULL),
(16, 'Xiaocai', 'Lin','Manager','M', NULL),
(17, 'Silvia', 'Huang','Cleaner','M', NULL),
(18, 'Yimeng', 'Zhao','Chef','M', NULL),
(19, 'Viola', 'Du','Cashier','F', NULL),
(20, 'Shirley', 'Zhou','Cahsier','M', NULL);
GO