CREATE TABLE [dbo].[Book]
(
	[BookId] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[BookTitle] VARCHAR(50),
	[BookTypeId] INT NOT NULL 
	CONSTRAINT FK_BookType_Book FOREIGN KEY (BookTypeId) REFERENCES BookType(BookTypeId)
 ); 
 

