/*
CREATE TYPE dbo.Tools
AS TABLE
(
  CuttingMethodId INT
);
GO
*/

CREATE PROCEDURE [dbo].[spSaveToolSetupSheet] (
@SetupSheetID int,
@PartNumber varchar(30) = NULL,
@Revision varchar(20) = NULL,
@Operation int = NULL,
@InputDate datetime = NULL,
@Machine varchar(50) = NULL,
@ProgramNumber varchar(50) = NULL,
@ProgramLocation varchar(100) = NULL,
@UOM varchar(20) = NULL,
@MaterialType varchar(50) = NULL,
@MaterialHeatTreated varchar(50) = NULL,
@MaterialForm varchar(50) = NULL,
@MaterialSize varchar(20) = NULL,
@MachineWorkHoldingTo varchar(20) = NULL,
@CutWorkHoldingTo varchar(20) = NULL,
@workHolding1ItemNumber varchar(20) = NULL,
@workHolding1ImagePath varchar(100) = NULL,
@workHolding2ItemNumber varchar(20) = NULL,
@workHolding2ImagePath varchar(100) = NULL,
@workHolding3ItemNumber varchar(20) = NULL,
@workHolding3ImagePath varchar(100) = NULL,
@workHolding1MWID varchar(20) = NULL,
@workHolding2MWID varchar(20) = NULL,
@workHolding3MWID varchar(20) = NULL,
@workHolding1Location varchar(50) = NULL,
@workHolding2Location varchar(50) = NULL,
@workHolding3Location varchar(50) = NULL,
@workHoldingComments varchar(200) = NULL,
@workHoldingImageNoPart varchar(50) = NULL,
@workHoldingImageWithPart varchar(50) = NULL,
@workHoldingImageComplete varchar(50) = NULL,
@Torque varchar(20) = NULL,
@HoldPartOn varchar(20) = NULL,
@Z0 varchar(20) = NULL,
@BarStickOutBefore varchar(20) = NULL,
@FaceOff varchar(20) = NULL,
@CutOffToolThickness varchar(20) = NULL,
@OAL varchar(20) = NULL,
@BarStickOutAfter varchar(20) = NULL,
@BarPullOut varchar(20) = NULL,
@PartStickOutMinimum varchar(20) = NULL,
@Comments varchar(200) = NULL,
@Program varchar(max) = NULL,
@UserName varchar(20) = NULL)
--@ToolSetupList AS dbo.ToolSetup READONLY)

AS
BEGIN
  SET NOCOUNT ON;
  Declare @NewSetUpSheetId int 
  Set @NewSetUpSheetId = @SetUpSheetId

  If Exists(Select '*' From ToolSetupSheet Where ID=@SetUpSheetId) -- PartNumber = @PartNumber And Revision = @Revision And Operation = @Operation And InputDate = @InputDate)  
  UPDATE ToolSetupSheet
  SET PartNumber = @PartNumber,
      Revision = @Revision,
      Operation = @Operation,
      InputDate = @InputDate,
      Machine = @Machine,
      ProgramNumber = @ProgramNumber,
      ProgramLocation = @ProgramLocation,
      UOM = @UOM,
      MaterialType = @MaterialType,
      MaterialHeatTreated = @MaterialHeatTreated,
      MaterialForm = @MaterialForm,
      MaterialSize = @MaterialSize,
      MachineWorkHoldingTo=@MachineWorkHoldingTo,
	  CutWorkHoldingTo=@CutWorkHoldingTo,
      workHolding1ItemNumber = @workHolding1ItemNumber,
      workHolding2ItemNumber = @workHolding2ItemNumber,
      workHolding3ItemNumber = @workHolding3ItemNumber,
      workHolding1ImagePath=@workHolding1ImagePath,
      workHolding2ImagePath=@workHolding2ImagePath,
      workHolding3ImagePath=@workHolding3ImagePath,
      workHolding1MWID = @workHolding1MWID,
      workHolding2MWID = @workHolding2MWID,
      workHolding3MWID = @workHolding3MWID,
      workHolding1Location = @workHolding1Location,
      workHolding2Location = @workHolding2Location,
      workHolding3Location = @workHolding3Location,
      workHoldingComments = @workHoldingComments,
      workHoldingImageNoPart = @workHoldingImageNoPart,
      workHoldingImageWithPart = @workHoldingImageWithPart,
      workHoldingImageComplete = @workHoldingImageComplete,
      Torque = @Torque,
      HoldPartOn = @HoldPartOn,
      Z0 = @Z0,
      BarStickOutBefore = @BarStickOutBefore,
      FaceOff = @FaceOff,
      CutOffToolThickness = @CutOffToolThickness,
      OAL = @OAL,
      BarStickOutAfter = @BarStickOutAfter,
      BarPullOut = @BarPullOut,
      PartStickOutMinimum=@PartStickOutMinimum,
      Comments = @Comments,
	  Program=@Program,
      ModifiedBy = @UserName,
      Modified = GETDATE()
  WHERE ID = @SetupSheetID
  Else
  BEGIN
  INSERT ToolSetupSheet
  Values 
  (
  @Machine,
  @PartNumber,
  @Revision,
  @Operation,
  @InputDate,
  @Machine,
@ProgramNumber,
@ProgramLocation,
@UOM,
@MaterialType,
@MaterialHeatTreated,
@MaterialForm,
@MaterialSize,
@MachineWorkHoldingTo,
@CutWorkHoldingTo,
@workHolding1ItemNumber,
@workHolding1ImagePath,
@workHolding2ItemNumber,
@workHolding2ImagePath,
@workHolding3ItemNumber,
@workHolding3ImagePath,
@workHolding1MWID,
@workHolding2MWID,
@workHolding3MWID,
@workHolding1Location,
@workHolding2Location,
@workHolding3Location,
@workHoldingComments,
@workHoldingImageNoPart,
@workHoldingImageWithPart,
@workHoldingImageComplete,
@Torque,
@HoldPartOn,
@Z0,
@BarStickOutBefore,
@FaceOff,
@CutOffToolThickness,
@OAL,
@BarStickOutAfter,
@BarPullOut,
@PartStickOutMinimum,
@Comments,
GetDate(),
@UserName,
@Program,
0,null,null
)
--Set @NewSetUpSheetId = SCOPE_IDENTITY()
END
  
Exec spInsertLookupValue @Category='PartNumber', @Value=@PartNumber, @Active=1
Exec spInsertLookupValue @Category='Revision', @Value=@Revision, @Active=1		
Exec spInsertLookupValue @Category='ProgramLocation', @Value=@ProgramLocation, @Active=1
Exec spInsertLookupValue @Category='Unit', @Value=@UOM, @Active=1	
Exec spInsertLookupValue @Category='MaterialType', @Value=@MaterialType, @Active=1
Exec spInsertLookupValue @Category='MaterialHeatTreated', @Value=@MaterialHeatTreated, @Active=1	
Exec spInsertLookupValue @Category='MaterialForm', @Value=@MaterialForm, @Active=1
Exec spInsertLookupValue @Category='MaterialSize', @Value=@MaterialSize, @Active=1	
Exec spInsertLookupValue @Category='MachineWorkHoldingTo', @Value=@MachineWorkHoldingTo, @Active=1
Exec spInsertLookupValue @Category='Torque', @Value=@Torque, @Active=1	
Exec spInsertLookupValue @Category='HoldPartOn', @Value=@HoldPartOn, @Active=1
Exec spInsertLookupValue @Category='Z0', @Value=@Z0, @Active=1	
Exec spInsertLookupValue @Category='BarStickOutBefore', @Value=@BarStickOutBefore, @Active=1	
Exec spInsertLookupValue @Category='FaceOff', @Value=@FaceOff, @Active=1
Exec spInsertLookupValue @Category='CutOffToolThickness', @Value=@CutOffToolThickness, @Active=1	
Exec spInsertLookupValue @Category='OAL', @Value=@OAL, @Active=1
Exec spInsertLookupValue @Category='BarStickOutAfter', @Value=@BarStickOutAfter, @Active=1				
Exec spInsertLookupValue @Category='PartStickOutMinimum', @Value=@PartStickOutMinimum, @Active=1

Select @NewSetUpSheetId

END