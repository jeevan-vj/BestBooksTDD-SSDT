CREATE PROCEDURE [MainTests].[test if added book type can be deleted]
	AS
	
  -- Assemble
	DECLARE @TypeId INT,@TypeName VARCHAR(40), @TypeDetail VARCHAR(200),
	@TypeId2 INT,@TypeName2 VARCHAR(40), @TypeDetail2 VARCHAR(200)
		
	SET @TypeId=1
	SET @TypeName='Adventure'
	SET @TypeDetail='This is all about adventure'

	SET @TypeId2=2
	SET @TypeName2='Mystery'
	SET @TypeDetail2='This is all about mystery'
	
	CREATE TABLE #Expected (Id INT,Name VARCHAR(40), Detail VARCHAR(200))
	CREATE TABLE #Actual (Id INT,Name VARCHAR(40), Detail VARCHAR(200))
	
	EXEC tSQLt.FakeTable 'dbo.BookType'

	INSERT INTO dbo.BookType
	(BookTypeId,[Name],Detail)
		VALUES
	(@TypeId,@TypeName,@TypeDetail),
	(@TypeId2,@TypeName2,@TypeDetail2)

	--ACT
	EXEC dbo.DeleteBookType @Id=@TypeId

	INSERT INTO #Actual 
	SELECT * FROM dbo.BookType

	INSERT INTO #Expected 
	VALUES
	(@TypeId2,@TypeName2,@TypeDetail2)

	-- Assert
	EXEC tSQLt.AssertEqualsTable '#Expected','#Actual','Record successfully deleted from table','Record was not deleted successfully'


RETURN 0
