USE [CarDB]
GO

:setvar myvar 1

DECLARE @cnt INT = 0;
WHILE @cnt < 2
BEGIN

SET IDENTITY_INSERT [dbo].[Cars] ON 
INSERT [dbo].[Cars] ([Id], [Name], [Description], [Location], [Age], [Price], [ImagePath]) VALUES ($(myvar)*1,CONCAT ( N'BMW', $(myvar)*1) , N'BMV X5 | 2004 | Diesel | Automatic| I have used this car for 6 years', N'London', 15, N'£ 5999', N'/Image/bmv.jpg')

INSERT [dbo].[Cars] ([Id], [Name], [Description], [Location], [Age], [Price], [ImagePath]) VALUES ($(myvar)*2, CONCAT ( N'Audi', $(myvar)*2), N'Audi TT 2010', N'Los Vegas', 4, N'£ 7999', N'/Image/car3.jpeg')

INSERT [dbo].[Cars] ([Id], [Name], [Description], [Location], [Age], [Price], [ImagePath]) VALUES ($(myvar)*3, CONCAT ( N'VW', $(myvar)*3), N'VM Golf 2019', N'Chicago', 6, N'£ 9588', N'/Image/car4.jpg')

INSERT [dbo].[Cars] ([Id], [Name], [Description], [Location], [Age], [Price], [ImagePath]) VALUES ($(myvar)*4, CONCAT ( N'Mercedes', $(myvar)*4), N'Benz C-Class | 2020 | Diesel | Automatic | 15000 mileage | Red', N'Arizona', 8, N'£ 29000', N'/Image/merc.jpg')

INSERT [dbo].[Cars] ([Id], [Name], [Description], [Location], [Age], [Price], [ImagePath]) VALUES ($(myvar)*5, CONCAT ( N'Ferarri', $(myvar)*5), N'F Type', N'Miami', 1, N'£ 49000', N'/Image/1.jpg')

INSERT [dbo].[Cars] ([Id], [Name], [Description], [Location], [Age], [Price], [ImagePath]) VALUES ($(myvar)*6, CONCAT ( N'Pink', $(myvar)*6), N'Pink panther GLI 2020', N'Los Vegas', 10, N'£ 79000', N'/Image/x5.jpeg')


 SET @cnt = @cnt + 1;

END;

SET IDENTITY_INSERT [dbo].[Cars] OFF

SELECT TOP (60) [Id]
      ,[Name]
      ,[Description]
      ,[Location]
      ,[Age]
      ,[Price]
      ,[ImagePath]
  FROM [CarDB].[dbo].[Cars]

Delete T 
From (Select Row_Number() Over(Partition By [Id], [Name] order By [ID]) As RowNumber,* 
From [CarDB].[dbo].[Cars]) T
Where T.RowNumber > 1

delete from [CarDB].[dbo].[Cars]
where name not in (
SELECT top 6 [Name]      
  FROM [CarDB].[dbo].[Cars]
)
