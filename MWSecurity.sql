USE [master]
GO
/****** Object:  Database [MWSecurity]    Script Date: 4/28/2018 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Permissions]    Script Date: 4/28/2018 4:50:27 PM ******/
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
	[Active] [bit] NULL,
	[CreatedOn] [date] NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/28/2018 4:50:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[RolesPermissions]    Script Date: 4/28/2018 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 4/28/2018 4:50:27 PM ******/
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
/****** Object:  Table [dbo].[UsersRoles]    Script Date: 4/28/2018 4:50:27 PM ******/
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
ALTER TABLE [dbo].[Permissions] ADD  CONSTRAINT [DF_Permissions_Active]  DEFAULT ((1)) FOR [Active]
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
/****** Object:  StoredProcedure [dbo].[GetPermissions]    Script Date: 4/28/2018 4:50:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec [GetPermissions]
 */
Create PROC [dbo].[GetPermissions]
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
				
	SELECT RowNum, Name, DisplayName, Active, RecordCount=0 INTO #Results FROM 
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
			COUNT(*) OVER() AS RecordCount, u.Name, u.DisplayName, u.Active
		FROM Permissions u (NOLOCK)			
		WHERE @SearchParm is null Or (u.Name like '%'+@SearchParm+'%')) AS Permissions
		
		DECLARE @RecordCount INT = 0
		SELECT @RecordCount = COUNT(*) FROM #Results
		
		UPDATE #Results SET RecordCount=@RecordCount WHERE RowNum=1
				
		SELECT * FROM #Results
			WHERE RowNum BETWEEN @FirstRow AND @LastRow  ORDER BY RowNum    			
	
END



GO
/****** Object:  StoredProcedure [dbo].[GetRoles]    Script Date: 4/28/2018 4:50:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec [GetRoles] @Status=0
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
			Left Join UsersRoles ur (NOLOCK) On ur.RoleID=r.Id 
		WHERE (Active=@Status Or @Status is null) 
			And (@SearchParm is null Or r.Name like '%'+@SearchParm+'%')
			And (@UserId is null or ur.UserID=@UserId)
		) AS Roles
		
		DECLARE @RecordCount INT = 0
		SELECT @RecordCount = COUNT(*) FROM #Results
		
		UPDATE #Results SET RecordCount=@RecordCount WHERE RowNum=1
				
		SELECT Id, Name, DisplayName, Active, RecordCount FROM #Results
			WHERE RowNum BETWEEN @FirstRow AND @LastRow  ORDER BY RowNum    			
	
END


-- update roles set active=0 where id=11
GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 4/28/2018 4:50:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec [GetUser] 1
 */
CREATE PROC [dbo].[GetUser]
(
@Id	int
)
AS
BEGIN

	Set NoCount On		
	Select u.ID, u.UserName, u.FirstName, u.LastName, u.Email, u.Active, u.Roles, u.[Permissions]
		FROM Users u (NOLOCK)			
		WHERE Id=@Id		
	
END



GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 4/28/2018 4:50:27 PM ******/
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
		WHERE @SearchParm is null Or (u.UserName like '%'+@SearchParm+'%')) AS Users
		
		DECLARE @RecordCount INT = 0
		SELECT @RecordCount = COUNT(*) FROM #Results
		
		UPDATE #Results SET RecordCount=@RecordCount WHERE RowNum=1
				
		SELECT * FROM #Results
			WHERE RowNum BETWEEN @FirstRow AND @LastRow  ORDER BY RowNum    			
	
END



GO
/****** Object:  StoredProcedure [dbo].[SetUserRoles]    Script Date: 4/28/2018 4:50:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
exec [SetUserRoles] 1
 */
CREATE PROC [dbo].[SetUserRoles]
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
USE [master]
GO
ALTER DATABASE [MWSecurity] SET  READ_WRITE 
GO
