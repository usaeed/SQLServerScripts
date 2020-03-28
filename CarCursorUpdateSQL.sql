DECLARE @CarId int
Declare @CarName nvarchar(10)

DECLARE CarCursor CURSOR FOR
	SELECT Id FROM Cars;

OPEN CarCursor

FETCH NEXT FROM CarCursor into @CarId

While(@@FETCH_STATUS = 0)
Begin	
	Select @CarName = Name from Cars where Id = @CarId
	if(@CarName = 'BMW')
	Begin 
		Update Cars set Price = '£ 5999', ImagePath = '/Image/1.jpg' where Id = @CarId
	End
	else if(@CarName = 'Audi')
	Begin 
		Update Cars set Price = '£ 7999', ImagePath = '/Image/1.jpg' where Id = @CarId
	End
	else if(@CarName = 'VW')
	Begin 
		Update Cars set Price = '£ 9588', ImagePath = '/Image/1.jpg' where Id = @CarId
	End
	else if(@CarName = 'Mercedes')
	Begin 
		Update Cars set Price = '£ 29000', ImagePath = '/Image/1.jpg' where Id = @CarId
	End
	else if(@CarName = 'Ferarri')
	Begin 
		Update Cars set Price = '£ 49000', ImagePath = '/Image/1.jpg' where Id = @CarId
	End
	else if(@CarName = 'Pink')
	Begin 
		Update Cars set Price = '£ 79000', ImagePath = '/Image/1.jpg' where Id = @CarId
	End
	
	Fetch Next from CarCursor into @CarId
End

CLOSE CarCursor
DEALLOCATE CarCursor
