/****** Object:  Table [dbo].[Country]    Script Date: 08-07-2025 02:16:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [Name]) VALUES (1, N'India')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (2, N'USA')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (3, N'England')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (5, N'Ireland')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (6, N'Ireland')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (7, N'Ireland')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (8, N'Ireland')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (9, N'Ireland')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
CREATE TRIGGER trgMasterDataUpdate
ON Country
AFTER UPDATE
AS
BEGIN
    DECLARE @cmd VARCHAR(2000);
    SET @cmd = 'curl -X POST "http://localhost:5000/api/cache/update" -H "Content-Type: application/json" -d "{ \"key\": \"masterData\" }"';
    EXEC xp_cmdshell @cmd;
END; 