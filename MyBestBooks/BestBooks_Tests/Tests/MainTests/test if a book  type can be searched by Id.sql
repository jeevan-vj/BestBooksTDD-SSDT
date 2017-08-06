CREATE PROCEDURE [MainTests].[test if a book type can be searched by Id]
AS
Begin
-- ================================================================================================================
-- (1) Assemble
--================================================================================================================


	-- Declare and initialize variables to hold 2 records for BookType
	DECLARE @TypeId INT,@TypeName VARCHAR(40), @TypeDetail VARCHAR(200),
	@TypeId2 INT,@TypeName2 VARCHAR(40), @TypeDetail2 VARCHAR(200)
		
	SET @TypeId=1
	SET @TypeName='Adventure'
	SET @TypeDetail='This is all about adventure'

	SET @TypeId2=2
	SET @TypeName2='Mystery'
	SET @TypeDetail2='This is all about mystery'
	
	-- Create Expected and Actual temporary tables with same fields as BookType table
	CREATE TABLE #Expected (Id INT,Name VARCHAR(40), Detail VARCHAR(200))
	CREATE TABLE #Actual (Id INT,Name VARCHAR(40), Detail VARCHAR(200))
	
	-- Remove dependencies from BookType table
	EXEC tSQLt.FakeTable 'dbo.BookType'

	-- Add both records to the BookType table
	INSERT INTO dbo.BookType
	(BookTypeId,Name,Detail)
	VALUES
	(@TypeId,@TypeName,@TypeDetail),
	(@TypeId2,@TypeName2,@TypeDetail2)

	-- Add second record to the Expected temporary table
	INSERT INTO #Expected (Id,Name,Detail)
	VALUES
	(@TypeId2,@TypeName2,@TypeDetail2)

-- ================================================================================================================
-- (2) Act
--================================================================================================================

	-- Call SearchByBookTypeId stored procedure and insert the results into Actual
	INSERT INTO #Actual (Id,Name,Detail)
	EXEC dbo.SearchBookTypeById @TypeId2

-- ================================================================================================================
-- (3) Assert
--================================================================================================================

	-- Match Actual and Expected tables
	EXEC tSQLt.AssertEqualsTable #Expected,#Actual

END
