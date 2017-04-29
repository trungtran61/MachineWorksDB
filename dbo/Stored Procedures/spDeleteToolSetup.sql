

CREATE PROCEDURE [dbo].[spDeleteToolSetup] (
@SetupSheetID int,
@ToolSetupID int,
@UserName varchar(20) = NULL)

AS
BEGIN
  SET NOCOUNT ON;
  Delete [ToolSetupGroup]
	From [ToolSetupGroup] tsg
	Inner Join [ToolSetupSheet_ToolSetup] tssts
		On tsg.[ToolSetupId]=tssts.ToolSetup_ID
		Where [ToolSetupSheet_ID]=@SetupSheetID
			And tssts.ToolSetup_ID=@ToolSetupID

  Delete [ToolSetup] 
	From [ToolSetup] ts
		Inner Join [ToolSetupSheet_ToolSetup] tssts on ts.ID =tssts.ToolSetup_ID
		Where [ToolSetupSheet_ID]=@SetupSheetID
			And ts.Id=@ToolSetupID
	
  Delete [ToolSetupSheet_ToolSetup] Where 
	[ToolSetupSheet_ID]=@SetupSheetID
	And ToolSetup_ID=@ToolSetupID

END