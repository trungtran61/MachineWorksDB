/****** Script for SelectTopNRows command from SSMS  ******/
-- [spAddToolSetupSheet]

CREATE Proc [dbo].[spUpdateConvertedToolSetupSheet]
(
@ToolSetupSheetID int,
@MachineId varchar(50),
@Program varchar(max),
@UserName varchar(50)
)
As
Begin

Set NoCount On
 
Update dbo.ToolSetupSheet Set Machine=@MachineId,Program=@Program, Modified=GetDate(), ModifiedBy=@UserName
	 Where ID=@ToolSetupSheetID	
 
End 


