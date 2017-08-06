CREATE PROCEDURE [dbo].[test if added BookType can be updated]
AS
BEGIN
	
	-- Assemble
	DECLARE @Id INT,@TypeName VARCHAR(40), @TypeDetail VARCHAR(200),@TypeName2 VARCHAR(40), @TypeDetail2 VARCHAR(200)
	
	SET @Id=1
	SET @TypeName='Adventure'
	SET @TypeDetail='This is about adventure'
	
	CREATE TABLE #Expected (Id INT, Name VARCHAR(40), Detail VARCHAR(200))
	
	EXEC tSQLt.FakeTable 'dbo.BookType'

	INSERT INTO dbo.BookType (BookTypeId,Name,Detail)
	values
	(@Id,@TypeName,@TypeDetail)

	INSERT INTO #Expected (Id,Name,Detail)
	values
	(@id,@TypeName2,@TypeDetail2)

	EXEC UpdateBookType @TypeName2,@TypeDetail2,1

	SELECT  BT.BookTypeId,BT.Name,BT.Detail  #Actual FROM dbo.BookType BT

	EXEC tSQLt.AssertEqualsTable '#Expected','#Actual'

END
