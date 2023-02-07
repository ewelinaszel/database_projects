
------------------------------ZAD3----------------------------------

CREATE TRIGGER taxRateMonitoring  
ON Sales.salesTaxRate 
FOR UPDATE 
AS
DECLARE 
	@c AS INT
BEGIN  
	SET @c = (
				SELECT count(*) 
				FROM inserted i
				JOIN deleted d on i.SalesTaxRateID = d.SalesTaxRateID
				WHERE (i.TaxRate - d.TaxRate)/ d.TaxRate > 0.3
			)

	IF (@c > 0) 
	BEGIN
		PRINT('Nast¹pi³ wzrost o powy¿ej 30%')
	END
END;

select * from Sales.salesTaxRate;

UPDATE Sales.SalesTaxRate SET TaxRate = 7 WHERE SalesTaxRateID = 4;