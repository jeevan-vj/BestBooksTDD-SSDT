CREATE PROCEDURE [dbo].[SearchBookTypeById]
	@id int = 0
AS
BEGIN
	SELECT [BookTypeId], [Name], [Detail] FROM dbo.BookType WHERE BookTypeId=@id
END

