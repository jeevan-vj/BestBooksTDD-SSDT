CREATE PROCEDURE [dbo].[AddBookType]
	@Name VARCHAR(40),
	@Detail VARCHAR(200)
AS
BEGIN
	SET NOCOUNT ON
	
	 --Add a new book type to the table
	INSERT INTO BookType ([Name],Detail) 
	VALUES
	(@Name,@Detail)

		
END

