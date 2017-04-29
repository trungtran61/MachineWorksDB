

/*
  exec [ToolInventorySearch] @PageSize=500,@CategoryID=21,@CuttingMethods='TAP;MILL'
	- @SelectedToolIDs='10922,10924,10925'
*/
CREATE proc [dbo].[ToolInventorySearch]
(
@Name				varchar(50)=null
,@ItemNumber		varchar(50)=null
,@CategoryID		int=null
,@MWID				varchar(50)=null
,@Radius			varchar(50)=null
,@NumberOfCutters	int=null
,@ChipBreaker		varchar(100)=null
,@Material			varchar(50)=null
,@Grade				varchar(50)=null
,@Location			varchar(50)=null
,@ExtLocation		varchar(50)=null
,@Manufacturer		varchar(50)=null
,@Comment			varchar(255)=null
,@StatusID			int=null
,@ToolGroupNum		int=null
,@Description		varchar(max)=null
,@CuttingMethods	varchar(max)=null
,@NumOfCutters		int=null
,@ExternalLocation	varchar(255)=null
,@ToolGroupNumber	int=null
,@PackSize			decimal(10,2)=null
,@PageNumber		int=1
,@PageSize			int=50
,@SortColumn		varchar(30)=null
,@SortDirection		varchar(4)=null 
,@SelectedToolIDs varchar(max)=null
)
As
Begin
	Set NoCount On		
	Declare @OrderBy varchar(40) 
	Set @OrderBy = ISNULL(@SortColumn,'')+ISNULL(@SortDirection,'')
	Declare @FirstRow int 
	Set @FirstRow = (@PageNumber * @PageSize) - @PageSize + 1
	Declare @LastRow int 
	Set @LastRow = @FirstRow + @PageSize - 1
	
	Declare @tblCuttingMethods Table
	(
		CuttingMethod	varchar(50)
	)	

	If @CuttingMethods is not null
	Begin
		Insert @tblCuttingMethods
			Exec SplitStringIntoRows @sStrings=@CuttingMethods,@delimiter=';'
	End

	Select mwHID
		Into #CuttingMethodTools
		From
		(	
		Select mwHID, CuttingMethod=f.Item
		From [MWToolInventory]
		CROSS APPLY [dbo].fnSplitStrings(CuttingMethod,';') f
		) tcm
		Inner Join @tblCuttingMethods cm
			On cm.CuttingMethod=tcm.CuttingMethod		
	
	Declare @tblToolIDs Table
	(
			ToolID	int
	)		

	If @SelectedToolIDs is not null
	Begin
		Insert @tblToolIDs
			Exec SplitStringIntoRows @sStrings=@SelectedToolIDs,@delimiter=','
	End
			
	Select distinct 
		RowNum, ID, Name, ItemNumber, Manufacturer, MWID, Location, Radius, CuttingMethods, NumOfCutters, Material, 
		Grade, ChipBreaker, Comment, Description, ExternalLocation, CategoryID, StatusID, ToolGroupNumber, PackSize, 
		RecordCount=0  
	INTO #SearchResults from
	(
	Select ROW_NUMBER() Over 
		(Order By
			Case
				When @OrderBy = 'mwNameASC' THEN mwName
			End Asc,
			Case
				When @OrderBy = 'mwNameDESC' THEN mwName
			End Desc,
			Case
				When @OrderBy = 'mwItemNumberASC' THEN mwItemNumber
			End Asc,
			Case
				When @OrderBy = 'mwItemNumberDESC' THEN mwItemNumber
			End Desc,			
			Case
				When @OrderBy = '' THEN mwItemNumber
			End Desc) As RowNum,	
			COUNT(*) OVER() As ToolCount, ID=vti.mwHID, 
				 CategoryID=mwCategoryID, CheckedOut=mwQtyx, ChipBreaker=mwChipBreaker, Code=mwCode, Comment=mwComment, CuttingMethods=CuttingMethod, 
				 Description=Description, ExternalLocation=mwExtLocation, Grade=mwGrade, InventoryLevel=mwInvLevel, isLocked=isLocked, 
				 ItemNumber=mwItemNumber, Location=mwLocation, Manufacturer=mwManufacturer, Material=mwMaterial, MWID=mwMWID, Name=mwName, 
				 NumOfCutters=mwNumofCutter, OnHand=mwQty, OrderPoint=mwOrderPoint, PackSize=PackSize, Radius=mwRadius, StatusID=mwStatusID, 
				 ToolGroupNumber=ToolGroupNum, Unit=Unit, UnitPrice=mwUnitPrice
		From vwToolsInventory vti (nolock)	
			Left Join #CuttingMethodTools cmt On cmt.mwHID=vti.mwHID 
			Left Outer Join @tblToolIDs ti On vti.mwHID=ti.ToolID
		Where 
			ti.ToolID is null 
			And
			(cmt.mwHID is not null Or @CuttingMethods is null) and
			(mwName = @Name Or @Name is null) and
			(ltrim(rtrim(mwItemNumber)) = ltrim(rtrim(@ItemNumber)) Or @ItemNumber is null) and
			(mwCategoryID = @CategoryID Or @CategoryID is null) and
			(mwManufacturer = @Manufacturer Or @Manufacturer is null) and
			(mwMWID = @MWID Or @MWID is null) and
			(mwLocation = @Location Or @Location is null) and
			(mwRadius = @Radius Or @Radius is null) and
			(CuttingMethod is not null Or @CuttingMethods is null) and
			(mwNumofCutter = @NumOfCutters Or @NumOfCutters is null) and
			(mwMaterial = @Material Or @Material is null) and
			(mwGrade = @Grade Or @Grade is null) and
			(mwChipBreaker = @ChipBreaker Or @ChipBreaker is null) and
			(mwComment = @Comment Or @Comment is null) and
			(Description = @Description Or @Description is null) and
			(mwExtLocation = @ExternalLocation Or @ExternalLocation is null) and
			(mwCategoryID = @CategoryID Or @CategoryID is null) and
			(mwStatusID = @StatusID Or @StatusID is null) and
			(ToolGroupNum = @ToolGroupNumber Or @ToolGroupNumber is null) and
			(PackSize = @PackSize Or @PackSize is null) 			
		    ) As Batches
			Order by RowNum  
		
		Declare @RecordCount int 
		
		Select @RecordCount = COUNT(*) FROM #SearchResults

		Update #SearchResults Set RecordCount=@RecordCount Where RowNum=@FirstRow
			
		SELECT RowNum, ID, 
			Name, ItemNumber, Manufacturer, MWID, Location, Radius, CuttingMethods, NumOfCutters, Material, 
			Grade, ChipBreaker, Comment, Description, ExternalLocation, CategoryID, StatusID, ToolGroupNumber, PackSize, 
			RecordCount
		 FROM #SearchResults
			Where RowNum Between @FirstRow And @LastRow     				
		
End

