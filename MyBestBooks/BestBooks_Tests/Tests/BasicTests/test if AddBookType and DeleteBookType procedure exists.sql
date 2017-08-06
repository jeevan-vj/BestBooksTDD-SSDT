CREATE PROCEDURE [BasicTests].[test if AddBookType and DeleteBookType procedure exists]
AS
	EXEC tSQLt.AssertObjectExists 'BestBooks.dbo.AddBookType'
	EXEC tSQLt.AssertObjectExists 'BestBooks.dbo.DeleteBookType'
RETURN 0
