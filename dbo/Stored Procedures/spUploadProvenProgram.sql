
/****** Script for SelectTopNRows command from SSMS  ******/
-- [spAddToolSetupSheet]

CREATE Proc [dbo].[spUploadProvenProgram]
(
@ToolSetupSheetID int,
@UseExistingSheet bit=1,
@UploadedProgramText nvarchar(max),
@UserName varchar(50)
)
As
Begin

 Set NoCount On
 SET XACT_ABORT ON

 If @UseExistingSheet = 1 
 Begin
	Update ToolSetupSheet Set Program=@UploadedProgramText, ProgramProven=1, ModifiedBy=@UserName, Modified=GetDate()
		Where ID=@ToolSetupSheetID
	Return @ToolSetupSheetID
 End

 Declare @NewToolSetupSheetID int
 
-- BEGIN TRY
--    BEGIN TRANSACTION
		Exec @NewToolSetupSheetID = spCopyToolSetupSheet
			 @ToolSetupSheetID=@ToolSetupSheetID,
			 @UserName=@UserName 
		Update ToolSetupSheet Set Program=@UploadedProgramText, ProgramProven=1, ModifiedBy=@UserName, Modified=GetDate()
			Where ID=@ToolSetupSheetID
		Return @NewToolSetupSheetID

--	COMMIT
--END TRY
--BEGIN CATCH
 --PRINT Error_Message()	
 --ROLLBACK
--END CATCH

End 

