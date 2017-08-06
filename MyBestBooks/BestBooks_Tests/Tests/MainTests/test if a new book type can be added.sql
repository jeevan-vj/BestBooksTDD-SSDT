CREATE PROCEDURE [MainTests].[test if a new book type can be added]
AS
BEGIN
	-- Assemble
	DECLARE @TypeName VARCHAR(40), @TypeDetail VARCHAR(200)
	
	SET @TypeName='Business Intelligence'
	SET @TypeDetail='This type of book contains information about Business Intelligence'
	
	CREATE TABLE MainTests.Expected (Name VARCHAR(40), Detail VARCHAR(200))
	CREATE TABLE MainTests.Actual (Name VARCHAR(40), Detail VARCHAR(200))
	
	EXEC tSQLt.FakeTable 'dbo.BookType'
	
	-- ACT	
	INSERT INTO MainTests.Expected (Name,Detail)
	VALUES
	(@TypeName,@TypeDetail)

	EXEC dbo.AddBookType @TypeName,@TypeDetail
	
	INSERT INTO MainTests.Actual (Name,Detail)
	SELECT BT.[Name],BT.Detail FROM dbo.BookType BT
	

	-- Assert
	EXEC tSQLt.AssertEqualsTable 'MainTests.Expected','MainTests.Actual'

END
