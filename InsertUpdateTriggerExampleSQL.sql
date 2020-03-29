USE [EmployeeDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [dbo].[EmployeeX]
GO
CREATE TABLE [dbo].[EmployeeX](
	[EmployeeID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Position] [varchar](50) NULL,
	[Office] [varchar](50) NULL,
	[Age] [int] NULL,
	[Salary] [int] NULL,
	[ImagePath] [varchar](max) NULL,
 CONSTRAINT [PK_Employeex] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[EmployeeX] ([EmployeeID], [Name], [Position], [Office], [Age], [Salary], [ImagePath]) VALUES (1, N'Fiona Green', N'Chief Operating Officer (COO)', N'San Francisco', 48, 212500, N'/Image/1.jpg')
GO
INSERT [dbo].[EmployeeX] ([EmployeeID], [Name], [Position], [Office], [Age], [Salary], [ImagePath]) VALUES (2, N'Angelica Ramos', N'Chief Executive Officer (CEO)', N'London', 47, 300000, N'/Image/car4.jpg')
GO
INSERT [dbo].[EmployeeX] ([EmployeeID], [Name], [Position], [Office], [Age], [Salary], [ImagePath]) VALUES (3, N'Paul Byrd', N'Chief Financial Officer (CFO)', N'New York', 64, 181250, N'/Image/1.jpg')
GO
INSERT [dbo].[EmployeeX] ([EmployeeID], [Name], [Position], [Office], [Age], [Salary], [ImagePath]) VALUES (4, N'Yuri Berry', N'Chief Marketing Officer (CMO)', N'New York', 99, 168750, N'/Image/1.jpg')
GO
INSERT [dbo].[EmployeeX] ([EmployeeID], [Name], [Position], [Office], [Age], [Salary], [ImagePath]) VALUES (5, N'Jackson Bradshaw', N'Director', N'New York', 99, 161437, N'/Image/1.jpg')
GO

--Create Trigger
Create TRIGGER reminder01
ON EmployeeX
AFTER INSERT, UPDATE   
AS RAISERROR ('Notify Customer Relations', 16, 1);  
GO 

--Fire update command
update [EmployeeDB].[dbo].[EmployeeX] set age = 53 where employeeid = 4

--Fire insert command
INSERT [dbo].[EmployeeX] ([EmployeeID], [Name], [Position], [Office], [Age], [Salary], [ImagePath]) VALUES (6, N'Tommy Bradshaw', N'Administrator', N'Vegas', 44, 123437, N'/Image/1.jpg')
GO
