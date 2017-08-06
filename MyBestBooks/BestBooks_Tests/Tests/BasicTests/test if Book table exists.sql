CREATE PROCEDURE [BasicTests].[test if Book table exists]
AS
BEGIN
	
	EXEC tSQLt.AssertObjectExists 'dbo.book'

END
