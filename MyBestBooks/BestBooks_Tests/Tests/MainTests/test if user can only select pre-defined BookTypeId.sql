CREATE PROCEDURE [MainTests].[test if user can only select pre-defined BookTypeId]
	
AS
BEGIN
  
	DECLARE @TypeId INT,@TypeName VARCHAR(40), @TypeDetail VARCHAR(200),
	@ErrorMessage NVARCHAR(MAX) SET @ErrorMessage='';
			
	SET @TypeId=1
	SET @TypeName='Adventure'
	SET @TypeDetail='This is all about adventure'

	EXEC tSQLt.FakeTable 'dbo.BookType'
	EXEC tSQLt.FakeTable 'dbo.Book'

	INSERT INTO dbo.BookType 
	(BookTypeId,Name,Detail)
	VALUES
	(@TypeId,@TypeName,@TypeDetail)
	
	EXEC tSQLt.ApplyConstraint 'dbo.Book','FK_BookType_Book'

	BEGIN TRY
		INSERT INTO dbo.Book (BookId, BookTitle, BookTypeId)
		VALUES
		(1,'Something about Science!',2)
	END TRY
	
	BEGIN CATCH

		SET @ErrorMessage=ERROR_MESSAGE() 

	END CATCH

	IF @ErrorMessage NOT LIKE '%The INSERT statement conflicted with the FOREIGN KEY constraint "FK_BookType_Book"%'
	BEGIN
		EXEC tSQLt.Fail 'Expected Foreign Key conflict but some other error was caught by the exception'
	END
END