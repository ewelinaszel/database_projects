
-----------------------ZAD1--------------------------------------

ALTER PROCEDURE dbo.GetFibonacciSequence (@n int)
AS
BEGIN
	DECLARE @rec int
	DECLARE cursor_fibonacci CURSOR FOR (select * from dbo.GenerateFibonacci(@n))
	
	OPEN cursor_fibonacci
	FETCH NEXT FROM cursor_fibonacci INTO @rec
	WHILE @@FETCH_STATUS=0
	BEGIN 
		PRINT(STR(@rec))
		FETCH NEXT FROM cursor_fibonacci INTO @rec
	END;
	CLOSE cursor_fibonacci
	DEALLOCATE cursor_fibonacci
END;

Select * from dbo.GenerateFibonacci(25)
EXEC dbo.GetFibonacciSequence @n=25;