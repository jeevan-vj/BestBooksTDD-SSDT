CREATE PROCEDURE [BasicTests].[test if BookType table exists]
AS
BEGIN
	
	EXEC tSQLt.AssertObjectExists	'dbo.BookType'

END
