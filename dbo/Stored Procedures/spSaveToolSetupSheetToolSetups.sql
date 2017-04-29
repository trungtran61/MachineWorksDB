
CREATE PROCEDURE [dbo].[spSaveToolSetupSheetToolSetups] (
	@ID int=0,
	@SetupSheetID int=0,
	@Sequence	int,
    @N	int=NULL,
    @ToolNumber	int=NULL,
    @TONumber	int=NULL,
    @CuttingMethod	varchar(50)=NULL,
	@SpecialComment	varchar(50)=NULL,
	@PartsPerCorner int=NULL,
	@SecondsPerTool int=NULL,
    @Snippet varchar(max)=NULL,
    @ToolID int=NULL,
	@ToolHolder1ID int=NULL,
	@ToolHolder2ID int=NULL,
	@ToolHolder3ID int=NULL,
	@Comment varchar(max)=NULL,
	@UserName varchar(30)=NULL
)

AS
BEGIN
  SET NOCOUNT ON;

  If @ID > 0
	Update [dbo].[ToolSetup]
		Set [Sequence]=@Sequence, N=@N, ToolNumber=@ToolNumber, TONumber=@TONumber,  CuttingMethod=@CuttingMethod, SpecialComment=@SpecialComment, Snippet=@Snippet
			,PartsPerCorner=@PartsPerCorner, SecondsPerTool=@SecondsPerTool
			,ToolID=@ToolID, ToolHolder1ID=@ToolHolder1ID, ToolHolder2ID=@ToolHolder2ID, ToolHolder3ID=@ToolHolder3ID, Comment=@Comment, ModifiedBy=@UserName, Modified=GetDate()
			Where ID=@ID
  Else
  Begin			
	BEGIN TRY
	   BEGIN TRANSACTION [ToolSetup]
	Insert [dbo].[ToolSetup] ([Sequence], N, ToolNumber,TONumber, CuttingMethod, SpecialComment, 
		PartsPerCorner, SecondsPerTool,
		Snippet, ToolID, ToolHolder1ID, ToolHolder2ID, ToolHolder3ID, Comment, Created, CreatedBy )
    Values
    (
      @Sequence, @N, @ToolNumber, @TONumber, @CuttingMethod, @SpecialComment,
	  @PartsPerCorner, @SecondsPerTool,
	   @Snippet, @ToolID, @ToolHolder1ID, @ToolHolder2ID,	@ToolHolder3ID, @Comment, GETDATE(), @UserName
    )
	If @SetupSheetID > 0
		Insert [ToolSetupSheet_ToolSetup] 
			([ToolSetupSheet_ID], [ToolSetup_ID])
		Values (@SetupSheetID, SCOPE_IDENTITY())

	COMMIT TRAN [ToolSetup]
	END TRY
	BEGIN CATCH
		Exec usp_GetErrorInfo
		ROLLBACK 
	END CATCH
  End
END