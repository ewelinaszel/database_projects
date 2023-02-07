
USE AdventureWorks2019;
GO 
WITH TempEmployeeInfo AS
(
	SELECT Rate,LastName,FirstName FROM HumanResources.EmployeePayHistory eph
	join Person.Person p on p.BusinessEntityID = eph.BusinessEntityID
)
select * from TempEmployeeInfo;


-------------------------------------ZAD2--------------------------------------------
USE AdventureWorksLT2019;
GO 

WITH TempSalesInfo AS
(
	select CompanyName as companyname,FirstName as f_n, LastName as l_n, TotalDue as t_d from SalesLT.Customer c
	JOIN SalesLT.SalesOrderHeader soh on soh.CustomerID = c.CustomerID
) 
select CONCAT(companyname,'( ',f_n,' ',l_n,' )') as CompanyContact ,t_d as Revenue from TempSalesInfo
Order by CompanyContact;


SELECT * FROM SalesLT.SalesOrderDetail
SELECT * FROM SalesLT.SalesOrderHeader
SELECT * FROM SalesLT.Customer
SELECT * FROM SalesLT.ProductCategory;
SELECT * FROM SalesLT.Product;

-------------------------------ZAD3--------------------------------------


WITH TempSalesProductInfo AS
(
	select pc.Name as name,sod.LineTotal from SalesLT.ProductCategory pc
	join SalesLT.Product p on p.ProductCategoryID = pc.ProductCategoryID
	join SalesLT.SalesOrderDetail sod on sod.ProductID = p.ProductID
)
select name as Category ,convert(decimal(10,2),sum(LineTotal)) as SalesValue from TempSalesProductInfo
group by name;