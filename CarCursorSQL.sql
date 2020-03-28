DECLARE @Id int
DECLARE @Name nvarchar(30);

DECLARE CarCursor CURSOR FOR
	SELECT Id, Name FROM Cars where id < 6;

OPEN CarCursor

FETCH NEXT FROM CarCursor into @Id, @Name

While(@@FETCH_STATUS = 0)
Begin
	print 'Id = ' + Cast(@Id as Nvarchar(10)) + ' Name = ' + @Name
	Fetch Next from CarCursor into @Id, @Name
End

CLOSE CarCursor
DEALLOCATE CarCursor
