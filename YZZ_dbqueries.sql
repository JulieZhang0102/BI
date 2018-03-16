-- Team Name: YZZ Team Members:Qifei Yuan, Jiashu Zhang, Chenyu Zou

USE McDonalds;
GO

--1. Display all records in each table
SELECT * FROM Supplier;

SELECT * FROM WhoSupplies;

SELECT * FROM Employee;

SELECT * FROM Ingredient;

SELECT * FROM Store;

SELECT * FROM Recipe;

SELECT * FROM Transactions;

SELECT * FROM Menu;

SELECT * FROM Item;

SELECT * FROM TransactionItem;

--2. We want to know the total sales and total number of transactions for each store, listing from the highest sales to the lowest.
SELECT StoreID, SUM(TotalAmount) as Total_Sales,
COUNT(TransactionID) as Number_of_Transactions
FROM Transactions
GROUP BY StoreID
ORDER BY SUM(TotalAmount) DESC;

--3. We want to know the location (city and state) for each store as well sa each store's total sales and total number of transactions.
SELECT s.StoreID, s.State, s.City, SUM(t.TotalAmount)as Total_Sales,Count(t.TransactionID)as Number_of_Transactions
FROM Store as s
INNER JOIN Transactions as t
ON s.StoreID=t.StoreID
GROUP BY s.StoreID, s.State, S.City;

--4. We need to know all employees' first name and last name. Also, we want to know city and state they are working in if we have those records. In this question, we have 20 employees in total, but there are only 10 of them whom we have city and state records. Thus, we could use left outer join to keep all employees infomation while join those city and state information if matched. 
--We could not use full outer join because that will show the excess city and state information that do not have employee machthes, which we do not need in this quesiton. We could not use inner join because that will cause us miss some employee information. We could not use right outer join because that will given us the reverse results showing all city and state information and only showing employee information when the data matches.
SELECT E.FirstName, E.LastName, s.City, s.State
FROM Employee as E
LEFT OUTER JOIN Store as s
ON E.StoreID=s.StoreID
GROUP BY E.FirstName, E.LastName, s.City, s.State;

--5. For stores that have better total sales than the average, we want to list their total sales and total number of transactions as well as their locations (state and city).
SELECT s.StoreID, s.State, s.City, SUM(t.TotalAmount)as Total_Sales,Count(t.TransactionID)as Number_of_Transactions
FROM Store as s
INNER JOIN Transactions as t
ON s.StoreID= t.StoreID
WHERE t.TotalAmount>
(SELECT AVG(TotalAmount) as Total_Sales
FROM Transactions)
GROUP BY s.StoreID, s.State, S.City;