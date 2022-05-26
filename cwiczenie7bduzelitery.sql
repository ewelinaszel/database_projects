SELECT * FROM Person.Person;
SELECT * FROM Person.BusinessEntity;


-----------------------ZAD2--------------------------------------
USE AdventureWorks2019;  
GO  
CREATE TRIGGER UPPERLETTERS  
ON Person.Person 
FOR INSERT
AS  
BEGIN  
   UPDATE Person.Person  
   SET LastName =  UPPER(Person.LastName)
   FROM inserted  
   WHERE Person.BusinessEntityID IN (SELECT BusinessEntityID  FROM inserted)

END 


INSERT INTO Person.BusinessEntity(ModifiedDate) VALUES (Getdate())
INSERT INTO Person.Person(BusinessEntityID,FirstName,LastName,PersonType) Values (20779,'Ewelina', 'Szeliga','EM')