CREATE PROCEDURE [dbo].[DeleteBookType]
	@Id int = 0
AS
BEGIN
  DELETE FROM BookType WHERE BookTypeId=@Id
END