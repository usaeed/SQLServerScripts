USE [CarDB]
GO

SELECT [Id]
      ,[Name]
      ,[Description]
      ,[Location]
      ,[Age]
      ,[Price]
      ,[ImagePath]
  FROM [CarDB].[dbo].[Cars]

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCarsAudit](
	[AuditId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Location] [varchar](50) NULL,	
	[Price] [varchar](10) NULL,	
	[UpdateBy] nvarchar(128),
	[UpdateOn] datetime
) ON [PRIMARY]
GO

Create trigger tblTriggerAuditRecord on Cars
after update, insert
as 
begin
	insert into tblCarsAudit
	(Name,Location,Price,UpdateBy,UpdateOn)
	select i.name,i.location, i.price, SUSER_SNAME(), getdate() from Cars t
	inner join inserted i on t.id = i.Id
end
go

SET IDENTITY_INSERT [dbo].[Cars] ON 
INSERT [dbo].[Cars] ([Id], [Name], [Description], [Location], [Age], [Price], [ImagePath]) VALUES (77, N'Pink77', N'Pink panther GLI 2020', N'Los Vegas', 10, N'£ 79000', N'/Image/x5.jpeg')


















