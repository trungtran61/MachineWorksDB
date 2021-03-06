USE [master]
GO
/****** Object:  Database [MWSecurity]    Script Date: 5/18/2018 5:24:16 PM ******/
CREATE DATABASE [MWSecurity] ON  PRIMARY 
( NAME = N'MWSecurity', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS2008\MSSQL\DATA\MWSecurity.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MWSecurity_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS2008\MSSQL\DATA\MWSecurity_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MWSecurity] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MWSecurity].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MWSecurity] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MWSecurity] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MWSecurity] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MWSecurity] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MWSecurity] SET ARITHABORT OFF 
GO
ALTER DATABASE [MWSecurity] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MWSecurity] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MWSecurity] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MWSecurity] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MWSecurity] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MWSecurity] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MWSecurity] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MWSecurity] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MWSecurity] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MWSecurity] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MWSecurity] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MWSecurity] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MWSecurity] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MWSecurity] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MWSecurity] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MWSecurity] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MWSecurity] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MWSecurity] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MWSecurity] SET  MULTI_USER 
GO
ALTER DATABASE [MWSecurity] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MWSecurity] SET DB_CHAINING OFF 
GO
USE [MWSecurity]
GO
/****** Object:  UserDefinedTableType [dbo].[Assignments]    Script Date: 5/18/2018 5:24:17 PM ******/
CREATE TYPE [dbo].[Assignments] AS TABLE(
	[Name] [varchar](50) NULL,
	[Assigned] [bit] NULL
)
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[DisplayName] [varchar](50) NULL,
	[Active] [bit] NULL CONSTRAINT [DF_Permissions_Active]  DEFAULT ((1)),
	[CreatedOn] [date] NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[Name] [varchar](50) NULL,
	[DisplayName] [varchar](50) NULL,
	[Active] [bit] NULL CONSTRAINT [DF_Roles_Active]  DEFAULT ((1)),
	[CreatedOn] [date] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RolesPermissions]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesPermissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[PermissionId] [int] NULL,
 CONSTRAINT [PK_RolesPermissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Active] [bit] NULL CONSTRAINT [DF_Users_Active]  DEFAULT ((1)),
	[Roles] [varchar](max) NULL CONSTRAINT [DF_Users_Roles]  DEFAULT ('[]'),
	[Permissions] [varchar](max) NULL CONSTRAINT [DF_Users_Permissions]  DEFAULT ('[]'),
	[CreatedOn] [date] NULL,
	[ModifiedOn] [date] NULL,
	[ModifiedBy] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsersRoles]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_UsersRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 

INSERT [dbo].[Permissions] ([Id], [Name], [DisplayName], [Active], [CreatedOn]) VALUES (4, N'ManageUsers', N'Manage Users', 0, CAST(N'2018-05-04' AS Date))
INSERT [dbo].[Permissions] ([Id], [Name], [DisplayName], [Active], [CreatedOn]) VALUES (6, N'ManageRoles', N'Manage Roles', 1, CAST(N'2018-05-04' AS Date))
INSERT [dbo].[Permissions] ([Id], [Name], [DisplayName], [Active], [CreatedOn]) VALUES (7, N'ResourcesManager', N'Resources Manager', 1, CAST(N'2018-05-06' AS Date))
INSERT [dbo].[Permissions] ([Id], [Name], [DisplayName], [Active], [CreatedOn]) VALUES (8, N'ManageResources', N'Manage Resources', 1, CAST(N'2018-05-06' AS Date))
INSERT [dbo].[Permissions] ([Id], [Name], [DisplayName], [Active], [CreatedOn]) VALUES (9, N'ManageToolInventory', N'Manage Tool Inventory', 1, CAST(N'2018-05-07' AS Date))
SET IDENTITY_INSERT [dbo].[Permissions] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [ParentId], [Name], [DisplayName], [Active], [CreatedOn]) VALUES (1, 2, N'Inspection Department', N'Inspection Department', 1, NULL)
INSERT [dbo].[Roles] ([Id], [ParentId], [Name], [DisplayName], [Active], [CreatedOn]) VALUES (2, NULL, N'Manager', N'Manager', 1, NULL)
INSERT [dbo].[Roles] ([Id], [ParentId], [Name], [DisplayName], [Active], [CreatedOn]) VALUES (3, 2, N'Material Department', N'Material Department', 1, NULL)
INSERT [dbo].[Roles] ([Id], [ParentId], [Name], [DisplayName], [Active], [CreatedOn]) VALUES (4, 2, N'Quality Engineer', N'Quality Engineer', 0, NULL)
INSERT [dbo].[Roles] ([Id], [ParentId], [Name], [DisplayName], [Active], [CreatedOn]) VALUES (5, 2, N'Sales', N'Sales', 0, NULL)
INSERT [dbo].[Roles] ([Id], [ParentId], [Name], [DisplayName], [Active], [CreatedOn]) VALUES (6, 2, N'Specification', N'Specification', 1, NULL)
INSERT [dbo].[Roles] ([Id], [ParentId], [Name], [DisplayName], [Active], [CreatedOn]) VALUES (7, 2, N'Tool Admin', N'Tool Admin', 1, NULL)
INSERT [dbo].[Roles] ([Id], [ParentId], [Name], [DisplayName], [Active], [CreatedOn]) VALUES (8, 2, N'Tool Department', N'Tool Department', 1, NULL)
INSERT [dbo].[Roles] ([Id], [ParentId], [Name], [DisplayName], [Active], [CreatedOn]) VALUES (9, 2, N'Tool View Only', N'Tool View Only', 1, NULL)
INSERT [dbo].[Roles] ([Id], [ParentId], [Name], [DisplayName], [Active], [CreatedOn]) VALUES (10, 2, N'Tool-Image', N'Tool-Image', 1, NULL)
INSERT [dbo].[Roles] ([Id], [ParentId], [Name], [DisplayName], [Active], [CreatedOn]) VALUES (11, 2, N'Viewer', N'Viewer', 0, NULL)
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[RolesPermissions] ON 

INSERT [dbo].[RolesPermissions] ([Id], [RoleId], [PermissionId]) VALUES (1, 1, 6)
INSERT [dbo].[RolesPermissions] ([Id], [RoleId], [PermissionId]) VALUES (5, 2, 8)
INSERT [dbo].[RolesPermissions] ([Id], [RoleId], [PermissionId]) VALUES (6, 2, 6)
INSERT [dbo].[RolesPermissions] ([Id], [RoleId], [PermissionId]) VALUES (7, 2, 4)
SET IDENTITY_INSERT [dbo].[RolesPermissions] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (1, N'Admin', N'Password', N'Ryan', N'Tran', N'aa@yahoo.com', 1, N'["Admin"]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (2, N'AP', N'Password', N'Trung', N'Tran', N'tvt@gmail.com', 0, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (3, N'AS9100', N'Password', N'As', N'400', N'trungtran61@yahoo.com', 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (4, N'Chi', N'Password', N'Chi', N'Nguyen', N'trungtran61@yahoo.com', 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (5, N'ChristineS', N'Password', N'Chris', N'Summer', N'trungtran61@gmail.com', 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (6, N'CuongN', N'Password', NULL, NULL, NULL, 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (7, N'HaiLe', N'Password', N'Hai', N'Le', N'Hai@ho.com', 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (8, N'haun', N'Password', NULL, NULL, NULL, 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (9, N'hoangl', N'Password', N'Hoang', N'Le', N'trungtran61@GMAIL.COM', 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (10, N'hotwater', N'Password', NULL, NULL, NULL, 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (11, N'hungm', N'Password', NULL, NULL, NULL, 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (12, N'minht', N'Password', N'Minh', N'Tran', N'ap@gmail.com', 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (13, N'nghian', N'Password', NULL, NULL, NULL, 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (14, N'NghiaP', N'Password', NULL, NULL, NULL, 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (15, N'PhucN', N'Password', NULL, NULL, NULL, 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (16, N'phun', N'Password', NULL, NULL, NULL, 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (17, N'RandyPhan', N'Password', NULL, NULL, NULL, 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (18, N'SonP', N'Password', NULL, NULL, NULL, 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (19, N'test', N'Password', NULL, NULL, NULL, 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (20, N'thuand', N'Password', NULL, NULL, NULL, 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (21, N'TienPhan', N'Password', N'Tien', N'Phan', N'trungtran61@gmail.com', 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (22, N'TimC', N'Password', NULL, NULL, NULL, 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (23, N'trangh', N'Password', NULL, NULL, NULL, 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (24, N'TrishaC', N'Password', NULL, NULL, NULL, 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (25, N'TruongT', N'Password', NULL, NULL, NULL, 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (26, N'TuanH', N'Password', NULL, NULL, NULL, 1, N'[]', N'[]', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (28, N'Admin', NULL, N'Trung', N'Tran', N'trungtran61@yahoo.com', 0, N'[]', N'[]', CAST(N'2018-04-30' AS Date), NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (33, N'ttra028', N'password', N'Nhi', N'Nguyen', N'trungtran61@GMAIL.COM', 1, N'[]', N'[]', CAST(N'2018-05-02' AS Date), NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (35, N'nhinguyen', N'password', N'Nhi', N'Nguyen', N'trungtran61@GMAIL.COM', 1, N'[]', N'[]', CAST(N'2018-05-02' AS Date), NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [FirstName], [LastName], [Email], [Active], [Roles], [Permissions], [CreatedOn], [ModifiedOn], [ModifiedBy]) VALUES (36, N'hieutran', N'password', N'hieu', N'Tran', N'trungtran61@yahoo.com', 1, N'[]', N'[]', CAST(N'2018-05-02' AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UsersRoles] ON 

INSERT [dbo].[UsersRoles] ([Id], [UserID], [RoleID]) VALUES (51, 33, 2)
INSERT [dbo].[UsersRoles] ([Id], [UserID], [RoleID]) VALUES (53, 35, 2)
INSERT [dbo].[UsersRoles] ([Id], [UserID], [RoleID]) VALUES (54, 35, 5)
INSERT [dbo].[UsersRoles] ([Id], [UserID], [RoleID]) VALUES (55, 35, 11)
INSERT [dbo].[UsersRoles] ([Id], [UserID], [RoleID]) VALUES (56, 36, 4)
INSERT [dbo].[UsersRoles] ([Id], [UserID], [RoleID]) VALUES (57, 36, 7)
INSERT [dbo].[UsersRoles] ([Id], [UserID], [RoleID]) VALUES (58, 3, 5)
INSERT [dbo].[UsersRoles] ([Id], [UserID], [RoleID]) VALUES (59, 1, 1)
INSERT [dbo].[UsersRoles] ([Id], [UserID], [RoleID]) VALUES (60, 1, 2)
INSERT [dbo].[UsersRoles] ([Id], [UserID], [RoleID]) VALUES (61, 1, 5)
INSERT [dbo].[UsersRoles] ([Id], [UserID], [RoleID]) VALUES (63, 21, 2)
SET IDENTITY_INSERT [dbo].[UsersRoles] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [Name_IX]    Script Date: 5/18/2018 5:24:17 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Name_IX] ON [dbo].[Permissions]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RolesPermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolesPermissions_Permissions] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permissions] ([Id])
GO
ALTER TABLE [dbo].[RolesPermissions] CHECK CONSTRAINT [FK_RolesPermissions_Permissions]
GO
ALTER TABLE [dbo].[RolesPermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolesPermissions_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[RolesPermissions] CHECK CONSTRAINT [FK_RolesPermissions_Roles]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersRoles_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UsersRoles_Roles]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersRoles_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UsersRoles_Users]
GO
/****** Object:  StoredProcedure [dbo].[GetPermission]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec [GetPermission] 6
 */
Create PROC [dbo].[GetPermission]
(
@Id	int
)
AS
BEGIN

	Set NoCount On	
	
	Select r.Id, r.Name, r.DisplayName, r.Active
		FROM Permissions r (NOLOCK)			
		WHERE Id=@Id			
		
END






GO
/****** Object:  StoredProcedure [dbo].[GetPermissions]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec [GetPermissions]
 */
CREATE PROC [dbo].[GetPermissions]
(
@SearchParm		varchar(30)=null
,@PageNumber	INT=1
,@PageSize		INT=50
,@SortColumn	VARCHAR(30)='Name'
,@SortDirection	VARCHAR(4)='ASC' 
)
AS
BEGIN

	Set NoCount On		
	
	Declare @OrderBy varchar(40) = ISNULL(@SortColumn,'')+ISNULL(@SortDirection,'')
	Declare @FirstRow int = (@PageNumber * @PageSize) - @PageSize + 1
	Declare @LastRow int = @FirstRow + @PageSize - 1	
				
	SELECT RowNum, Id, Name, DisplayName, Active, RecordCount=0 INTO #Results FROM 
	(
	SELECT ROW_NUMBER() OVER 
		(ORDER BY
			CASE
				WHEN @OrderBy = 'NameASC' THEN u.Name 
			END ASC,
			CASE
				WHEN @OrderBy = 'NameDESC' THEN u.Name 
			END DESC,
			CASE
				WHEN @OrderBy = 'DisplayNameASC' THEN u.DisplayName
			END ASC,
			CASE
				WHEN @OrderBy = 'DisplayNameDESC' THEN u.DisplayName
			END DESC,			
			CASE
				WHEN @OrderBy = '' THEN u.Name
			END ASC) AS RowNum,	
			COUNT(*) OVER() AS RecordCount, u.Id, u.Name, u.DisplayName, u.Active
		FROM [Permissions] u (NOLOCK)			
		WHERE @SearchParm is null Or (u.Name like '%'+@SearchParm+'%')) AS Permissions
		
		DECLARE @RecordCount INT = 0
		SELECT @RecordCount = COUNT(*) FROM #Results
		
		UPDATE #Results SET RecordCount=@RecordCount 
				
		SELECT * FROM #Results
			WHERE RowNum BETWEEN @FirstRow AND @LastRow  ORDER BY RowNum    			
	
END



GO
/****** Object:  StoredProcedure [dbo].[GetRole]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec [GetRole] 0
 */
CREATE PROC [dbo].[GetRole]
(
@Id	int
)
AS
BEGIN

	Set NoCount On	
	If @Id > 0	
	Select r.Id, r.Name, r.DisplayName, r.Active, 
		[Permissions]=
		Substring(
        (
            Select ','+Name+':'+ltrim(str(Assigned)) AS [text()]
            From (
				Select Name,Assigned=
					Case IsNull(rp.RoleId,0)
						When 0 Then Cast(0 as bit)
						Else 1
					End		
				From [Permissions] p
					Left Join RolesPermissions rp on rp.PermissionId=p.Id And rp.RoleId=@Id
				) p        
				ORDER BY Name
				For XML PATH ('')
			), 2, 1000)
		FROM Roles r (NOLOCK)			
		WHERE Id=@Id		
	Else
	Select Id=0, Name=null, DisplayName=null, Active=0, 
		[Permissions]=
		Substring(
        (
            Select ','+Name+':'+ltrim(str(Assigned)) AS [text()]
            From (
				Select Name,Assigned=
					Case IsNull(rp.RoleId,0)
						When 0 Then Cast(0 as bit)
						Else 1
					End		
				From [Permissions] p
					Left Join RolesPermissions rp on rp.PermissionId=p.Id And rp.RoleId=@Id
				) p        
				ORDER BY Name
				For XML PATH ('')
			), 2, 1000)	
		
END






GO
/****** Object:  StoredProcedure [dbo].[GetRoles]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec GetRoles @SearchParm=default,@Page
exec [GetRoles] @Status=0
exec GetRoles @SearchParm=default,@PageSize=5,@PageNumber=2
 */
CREATE PROC [dbo].[GetRoles]
(
@SearchParm		varchar(30)=null
,@PageNumber	INT=1
,@PageSize		INT=50
,@SortColumn	VARCHAR(30)='Name'
,@SortDirection	VARCHAR(4)='ASC' 
,@Status		bit=null
,@UserId		int=null
)
AS
BEGIN

	Set NoCount On		
	
	Declare @OrderBy varchar(40) = ISNULL(@SortColumn,'')+ISNULL(@SortDirection,'')
	Declare @FirstRow int = (@PageNumber * @PageSize) - @PageSize + 1
	Declare @LastRow int = @FirstRow + @PageSize - 1	
				
	SELECT RowNum, Id, Name, DisplayName, Active, RecordCount=0 INTO #Results FROM 
	(
	SELECT ROW_NUMBER() OVER 
		(ORDER BY
			CASE
				WHEN @OrderBy = 'NameASC' THEN r.Name 
			END ASC,
			CASE
				WHEN @OrderBy = 'NameDESC' THEN r.Name 
			END DESC,
			CASE
				WHEN @OrderBy = 'DisplayNameASC' THEN r.DisplayName
			END ASC,
			CASE
				WHEN @OrderBy = 'DisplayNameDESC' THEN r.DisplayName
			END DESC,			
			CASE
				WHEN @OrderBy = '' THEN r.Name
			END ASC) AS RowNum,	
			COUNT(*) OVER() AS RecordCount, r.Id, r.Name, r.DisplayName, r.Active
		FROM Roles r (NOLOCK)						
		WHERE (Active=@Status Or @Status is null) 
			And (@SearchParm is null Or r.Name like '%'+@SearchParm+'%')			
		) AS Roles
		
		DECLARE @RecordCount INT = 0
		SELECT @RecordCount = COUNT(*) FROM #Results
		
		UPDATE #Results SET RecordCount=@RecordCount 
				
		SELECT Id, Name, DisplayName, Active, RecordCount FROM #Results
			WHERE RowNum BETWEEN @FirstRow AND @LastRow  ORDER BY RowNum    			
	
END


-- update roles set active=0 where id=11
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec [GetUser] 33
 */
CREATE PROC [dbo].[GetUser]
(
@Id	int
)
AS
BEGIN

	Set NoCount On	
	If @Id > 0	
	Select u.ID, u.UserName, u.Password, u.FirstName, u.LastName, u.Email, u.Active, 
		Roles=
		Substring(
        (
            Select ','+Name+':'+ltrim(str(Assigned)) AS [text()]
            From (
				Select Name,Assigned=
					Case IsNull(ur.UserID,0)
						When 0 Then Cast(0 as bit)
						Else 1
					End		
				From Roles r
					Left Join UsersRoles ur on ur.RoleID=r.Id And ur.UserID=@Id
				) r        
				ORDER BY Name
				For XML PATH ('')
			), 2, 1000),
		u.[Permissions]
		FROM Users u (NOLOCK)			
		WHERE Id=@Id		
	Else
	Select ID=0, UserName=null, Password=null, FirstName=null, LastName=null, Email=null, Active=0, 
		Roles=
		Substring(
        (
            Select ','+Name+':'+ltrim(str(Assigned)) AS [text()]
            From (
				Select Name,Assigned=
					Case IsNull(ur.UserID,0)
						When 0 Then 0
						Else 1
					End		
				From Roles r
					Left Join UsersRoles ur on ur.RoleID=r.Id And ur.UserID=@Id
				) r        
				ORDER BY Name
				For XML PATH ('')
			), 2, 1000),
		[Permissions]=''
		--FROM Users u (NOLOCK)

	-- Get user's roles
	/*
	Select Name,Assigned=
		Case IsNull(ur.UserID,0)
			When 0 Then 0
			Else 1
		End
		Into #roles 
		From Roles r
		Left Join UsersRoles ur on ur.RoleID=r.Id And ur.UserID=@Id

	Select roles=Substring(
        (
            Select ','+Name+':'+ltrim(str(Assigned)) AS [text()]
            From 
			(
			Select Name,Assigned=
				Case IsNull(ur.UserID,0)
					When 0 Then 0
				Else 1
				End		
			From Roles r
				Left Join UsersRoles ur on ur.RoleID=r.Id And ur.UserID=@Id
			) r        
            ORDER BY Name
            For XML PATH ('')
        ), 2, 1000) 
*/	
END






GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec [GetUsers]
 */
CREATE PROC [dbo].[GetUsers]
(
@SearchParm		varchar(30)=null
,@PageNumber	INT=1
,@PageSize		INT=5
,@SortColumn	VARCHAR(30)=NULL
,@SortDirection	VARCHAR(4)='ASC' 
)
AS
BEGIN

	Set NoCount On		
	
	Declare @OrderBy varchar(40) = ISNULL(@SortColumn,'')+ISNULL(@SortDirection,'')
	Declare @FirstRow int = (@PageNumber * @PageSize) - @PageSize + 1
	Declare @LastRow int = @FirstRow + @PageSize - 1	
				
	SELECT RowNum, ID, [UserName], [FirstName],[LastName],[Email],Active, RecordCount=0 INTO #Results FROM 
	(
	SELECT ROW_NUMBER() OVER 
		(ORDER BY
			CASE
				WHEN @OrderBy = 'UserNameASC' THEN u.UserName 
			END ASC,
			CASE
				WHEN @OrderBy = 'UserNameDESC' THEN u.UserName 
			END DESC,
			CASE
				WHEN @OrderBy = 'FirstNameASC' THEN u.FirstName 
			END ASC,
			CASE
				WHEN @OrderBy = 'FirstNameDESC' THEN u.FirstName 
			END DESC,
			CASE
				WHEN @OrderBy = 'LastNameASC' THEN u.LastName 
			END ASC,
			CASE
				WHEN @OrderBy = 'LastNameDESC' THEN u.LastName 
			END DESC,
			CASE
				WHEN @OrderBy = 'EmailASC' THEN u.Email
			END ASC,
			CASE
				WHEN @OrderBy = 'EmailDESC' THEN u.Email							
			END DESC,	
			CASE
				WHEN @OrderBy = '' THEN u.FirstName
			END ASC) AS RowNum,	
			COUNT(*) OVER() AS RecordCount, u.ID, u.UserName, u.FirstName, u.LastName, u.Email, u.Active
		FROM Users u (NOLOCK)			
		WHERE @SearchParm is null Or (u.UserName like '%'+@SearchParm+'%') Or (u.FirstName like '%'+@SearchParm+'%')  Or (u.LastName like '%'+@SearchParm+'%')) AS Users
		
		DECLARE @RecordCount INT = 0
		SELECT @RecordCount = COUNT(*) FROM #Results
		
		UPDATE #Results SET RecordCount=@RecordCount 
				
		SELECT * FROM #Results
			WHERE RowNum BETWEEN @FirstRow AND @LastRow  ORDER BY RowNum    			
	
END



GO
/****** Object:  StoredProcedure [dbo].[UpdatePermission]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec [UpdatePermission] 1, 1
 */
CREATE PROC [dbo].[UpdatePermission]
(
@Id				int,
@Name			varchar(50),
@DisplayName	varchar(50),
@Active			bit
)
AS
BEGIN

	Set NoCount On
	Declare @NewId	int

	If @Id > 0
		Update [Permissions] Set Name=@Name, DisplayName=@DisplayName, Active=@Active WHERE Id=@Id			
	Else
	Begin
		Insert [Permissions] (Name, DisplayName, Active, CreatedOn)
			Values(@Name, @DisplayName, @Active, GetDate())
		Set @Id = SCOPE_IDENTITY()  
	End	
	
	Select @Id
		
END


--update users set Roles='["Admin","Engineering"]', [Permissions]='[]' where id=1
GO
/****** Object:  StoredProcedure [dbo].[UpdatePermissionStatus]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
exec [UpdateUserStatus] 1, 1
 */
Create PROC [dbo].[UpdatePermissionStatus]
(
@Id	int,
@Active bit
)
AS
BEGIN

	Set NoCount On
	Update [Permissions] Set Active=@Active WHERE Id=@Id			
	
END


--update users set Roles='["Admin","Engineering"]', [Permissions]='[]' where id=1

GO
/****** Object:  StoredProcedure [dbo].[UpdateRole]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec [UpdateUserStatus] 1, 1
 */
Create PROC [dbo].[UpdateRole]
(
@Id				int,
@Name			varchar(50),
@DisplayName	varchar(50),
@Active			bit,
@Permissions	[Assignments] readonly
)
AS
BEGIN

	Set NoCount On
	Declare @NewId	int

	Begin Try
		Begin Tran
	
		If @Id > 0
			Update Roles Set Name=@Name, DisplayName=@DisplayName,Active=@Active WHERE Id=@Id			
		Else
		Begin
			Insert Roles (Name, DisplayName, Active, CreatedOn)
				Values(@Name, @DisplayName, @Active,GetDate())
			Set @NewId = SCOPE_IDENTITY()  
		End
			
		If Exists(Select '*' From @Permissions)
		Begin
			If @Id > 0
				Delete RolesPermissions Where RoleID=@Id
			Else
				Set @Id = @NewId

			Insert RolesPermissions([RoleID],PermissionId)
				Select @Id, Id From [Permissions] p (nolock) 
				Inner Join @Permissions rp on p.Name=rp.Name
		End

		Commit Tran
	End Try
	Begin Catch
		Rollback Tran
		Throw
	End Catch

	Select @Id
		
END


--update users set Roles='["Admin","Engineering"]', [Permissions]='[]' where id=1
GO
/****** Object:  StoredProcedure [dbo].[UpdateRoleStatus]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
exec [UpdateUserStatus] 1, 1
 */
Create PROC [dbo].[UpdateRoleStatus]
(
@Id	int,
@Active bit
)
AS
BEGIN

	Set NoCount On
	Update Roles Set Active=@Active WHERE Id=@Id			
	
END


--update users set Roles='["Admin","Engineering"]', [Permissions]='[]' where id=1

GO
/****** Object:  StoredProcedure [dbo].[UpdateUserProfile]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec [UpdateUserStatus] 1, 1
 */
CREATE PROC [dbo].[UpdateUserProfile]
(
@Id			int,
@UserName	varchar(20),
@Password	varchar(20),
@Active		bit,
@FirstName  varchar(50),
@LastName   varchar(50),
@Email	    varchar(100)=null,
@Roles		[Assignments] readonly
)
AS
BEGIN

	Set NoCount On
	Declare @NewId	int

	Begin Try
		Begin Tran
	
		If @Id > 0
			Update Users Set Password=@Password,FirstName=@FirstName,LastName=@LastName,Email=@Email,Active=@Active WHERE Id=@Id			
		Else
		Begin
			Insert Users (UserName, Password, FirstName, LastName, Email,Active, CreatedOn)
				Values(@UserName,@Password,@FirstName,@LastName,@Email,@Active,GetDate())
			Set @NewId = SCOPE_IDENTITY()  
		End
			
		If Exists(Select '*' From @Roles)
		Begin
			If @Id > 0
				Delete UsersRoles Where UserID=@Id
			Else
				Set @Id = @NewId

			Insert UsersRoles([UserID], [RoleID])
				Select @Id, Id From Roles r (nolock) 
				Inner Join @Roles ur on r.Name=ur.Name
		End

		Commit Tran
	End Try
	Begin Catch
		Rollback Tran
		Throw
	End Catch

	Select @Id
		
END


--update users set Roles='["Admin","Engineering"]', [Permissions]='[]' where id=1
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserRoles]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec [SetUserRoles] 1
 */
CREATE PROC [dbo].[UpdateUserRoles]
(
@Id	int,
@Roles varchar(max)
)
AS
BEGIN

	Set NoCount On
	Begin Try
		Begin Tran
			Update Users Set Roles=@Roles WHERE Id=@Id		
		Commit
	End Try
	Begin Catch
		Rollback Tran
		Throw	
	End Catch

	
END


--update users set Roles='["Admin","Engineering"]', [Permissions]='[]' where id=1
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserStatus]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec [UpdateUserStatus] 1, 1
 */
Create PROC [dbo].[UpdateUserStatus]
(
@Id	int,
@Active bit
)
AS
BEGIN

	Set NoCount On
	Update Users Set Active=@Active WHERE Id=@Id			
	
END


--update users set Roles='["Admin","Engineering"]', [Permissions]='[]' where id=1
GO
/****** Object:  StoredProcedure [dbo].[ValidateUser]    Script Date: 5/18/2018 5:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec ValidateUser 'TienPhan','password'
 */
CREATE PROC [dbo].[ValidateUser]
(
@UserName	varchar(20),
@Password	varchar(20)
)
AS
BEGIN

	Set NoCount On	
	
	Select u.ID, u.UserName, u.FirstName, u.Email,
		[Permissions]=Substring(
        (
            Select ','+Name AS [text()]
            From (
				Select p.Name
				From Users u (nolock)
					Inner Join UsersRoles (nolock) ur  on u.Id=ur.UserID and u.UserName=@UserName
					Inner Join Roles r (nolock) on ur.RoleID=r.Id
					Inner Join RolesPermissions rp (nolock) on rp.RoleId=r.Id
					Inner Join [Permissions] p (nolock) on rp.PermissionId=p.Id
				) r        
				ORDER BY Name
				For XML PATH ('')
			), 2, 1000)
		FROM Users u (NOLOCK)			
		WHERE UserName=@UserName And Password=@Password			
	
END

/*
Select u.ID, u.UserName, u.Password, 
		[Permissions]=Substring(
        (
            Select UserName, ','+Name AS [text()]
            From (
				Select p.Name, u.UserName
				From Users u
					Inner Join UsersRoles ur on u.Id=ur.UserID 
					Inner Join Roles r on r.Id=ur.RoleID
					Inner Join RolesPermissions rp on rp.RoleId=r.Id
					Inner Join [Permissions] p on rp.PermissionId=p.Id
				) r        
				ORDER BY Name
				For XML PATH ('')
			), 2, 1000)
		FROM Users u (NOLOCK)		
*/


GO
USE [master]
GO
ALTER DATABASE [MWSecurity] SET  READ_WRITE 
GO
