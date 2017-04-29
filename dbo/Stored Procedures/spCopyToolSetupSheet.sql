/****** Script for SelectTopNRows command from SSMS  ******/
-- [spAddToolSetupSheet]

CREATE Proc [dbo].[spCopyToolSetupSheet]
(
@ToolSetupSheetID int,
@UserName varchar(50)
)
As
Begin

 Set NoCount On

 Declare @NewToolSetupSheetID int
 
 --BEGIN TRY
--    BEGIN TRANSACTION
 Insert dbo.ToolSetupSheet (MachineType,PartNumber,Revision,Operation,InputDate,Machine,ProgramNumber,ProgramLocation,
	UOM,MaterialType,MaterialHeatTreated,MaterialForm,MaterialSize,MachineWorkHoldingTo,workHolding1ItemNumber,workHolding1ImagePath,
	workHolding2ItemNumber,workHolding2ImagePath,workHolding3ItemNumber,workHolding3ImagePath,workHolding1MWID,workHolding2MWID,
	workHolding3MWID,workHolding1Location,workHolding2Location,workHolding3Location,workHoldingComments,workHoldingImageNoPart,
	workHoldingImageWithPart,workHoldingImageComplete,Torque,HoldPartOn,Z0,BarStickOutBefore,FaceOff,CutOffToolThickness,OAL,
	BarStickOutAfter,BarPullOut,PartStickOutMinimum,Comments,Program,Created,CreatedBy)
 Select MachineType,PartNumber,Revision,Operation,InputDate,Machine,ProgramNumber,ProgramLocation,
	UOM,MaterialType,MaterialHeatTreated,MaterialForm,MaterialSize,MachineWorkHoldingTo,workHolding1ItemNumber,workHolding1ImagePath,
	workHolding2ItemNumber,workHolding2ImagePath,workHolding3ItemNumber,workHolding3ImagePath,workHolding1MWID,workHolding2MWID,
	workHolding3MWID,workHolding1Location,workHolding2Location,workHolding3Location,workHoldingComments,workHoldingImageNoPart,
	workHoldingImageWithPart,workHoldingImageComplete,Torque,HoldPartOn,Z0,BarStickOutBefore,FaceOff,CutOffToolThickness,OAL,
	BarStickOutAfter,BarPullOut,PartStickOutMinimum,Comments,Program, GetDate(), @UserName From	 
	dbo.ToolSetupSheet Where ID=@ToolSetupSheetID	

Select @NewToolSetupSheetID=SCOPE_IDENTITY()


-- Get each TootSetup for Sheet being copied
Declare @ToolSetup_ID int,
	@NewToolSetup_ID int

Declare crsToolSetup Cursor
For
Select [ToolSetup_ID] From [ToolSetupSheet_ToolSetup]
	Where [ToolSetupSheet_ID] = @ToolSetupSheetID

Open crsToolSetup

Fetch Next From crsToolSetup Into @ToolSetup_ID

While @@FETCH_STATUS = 0
Begin
	-- copy tool setup 
	Insert [ToolSetup]
	(		
	Sequence,N,ToolNumber,TONumber,CuttingMethod,SpecialComment,PartsPerCorner,SecondsPerTool,Snippet,ToolID,ToolHolder1ID,ToolHolder2ID,ToolHolder3ID,
	ToolDesc,Created,CreatedBy
	)
	Select Sequence,N,ToolNumber,TONumber,CuttingMethod,SpecialComment,PartsPerCorner,SecondsPerTool,Snippet,ToolID,ToolHolder1ID,ToolHolder2ID,ToolHolder3ID,
		ToolDesc,GetDate(),@UserName
	From [ToolSetup] Where ID=@ToolSetup_ID

	Select @NewToolSetup_ID=SCOPE_IDENTITY()

	-- link newly created tool setup with new sheet
	Insert [ToolSetupSheet_ToolSetup] ([ToolSetupSheet_ID],[ToolSetup_ID])
		Select @NewToolSetupSheetID, @NewToolSetup_ID
		
	Fetch Next From crsToolSetup Into @ToolSetup_ID
End

Close crsToolSetup
Deallocate crsToolSetup

Return @NewToolSetupSheetID
--COMMIT
--END TRY
--BEGIN CATCH
 --ROLLBACK
--END CATCH

End 
