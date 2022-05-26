
-----------------------ZAD1--------------------------------------

ALTER FUNCTION dbo.GenerateFibonacci ( @LIMIT int)
RETURNS @Fibonacci_Table TABLE
(
	number int 
)
AS
BEGIN
	DECLARE 
			@F0 INT,
            @F1 INT,
            @Fibonacci_Number INT

	SET  @F0 = 0
	SET @F1 = 1

	INSERT INTO @Fibonacci_Table
	SELECT 0

	WHILE @LIMIT >= @F1
	BEGIN

      SET @Fibonacci_Number = @F0 + @F1
     

      INSERT INTO @Fibonacci_Table
      SELECT @F1
     
      SET @F0 = @F1
      SET @F1 = @Fibonacci_Number
	END

RETURN
END



