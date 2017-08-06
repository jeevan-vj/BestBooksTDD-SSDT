CREATE PROCEDURE [dbo].[UpdateBookType]
	@BookTypeName VARCHAR(40),
	@BookTypeDetail VARCHAR(200),
	@id int
AS
	
	UPDATE BookType set [Name]=@BookTypeName, Detail=@BookTypeDetail
	WHERE BookTypeId=@id

RETURN 0
