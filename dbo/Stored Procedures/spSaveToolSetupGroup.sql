CREATE Proc [dbo].[spSaveToolSetupGroup]
(
@MainID int,
@IDs	varchar(100),
@UserName	varchar(20)
)
As
Begin

Set NoCount On

Declare @tblIds Table
(
	id int,
	[sequence] int identity(1,1)	
)
Insert @tblIds (id)
	SELECT * FROM dbo.CSVToTable(@IDs)

Insert [ToolSetupGroup]
	([MainToolSetupId],[ToolSetupId], [Sequence], [Created],[CreatedBy])
Select @MainID, [ID], [sequence], GetDate(), @UserName  From @tblIds 

End 
   