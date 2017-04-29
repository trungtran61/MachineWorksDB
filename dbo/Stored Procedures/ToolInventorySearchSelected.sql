

/*
  exec [ToolInventorySearchSelected] @PageSize=5,@SelectedToolIDs='10922,10924,10925'
*/
CREATE proc [dbo].[ToolInventorySearchSelected]
(
@PageNumber	int=1
,@PageSize		int=50
,@SortColumn	varchar(30)=null
,@SortDirection	varchar(4)=null 
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
		RowNum, mwHID, mwName, mwItemNumber, CategoryName, mwDirection, mwQty, mwQtyx, RecordCount=0  
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
			COUNT(*) OVER() As ToolCount, mwHID, mwName, mwItemNumber, CategoryName, mwDirection, mwQty, mwQtyx
		From vwToolsInventory vti (nolock)	
			Inner Join @tblToolIDs ti On vti.mwHID=ti.ToolID						
		    ) As Batches
			Order by RowNum  
		
		Declare @RecordCount int 
		
		Select @RecordCount = COUNT(*) FROM #SearchResults

		Update #SearchResults Set RecordCount=@RecordCount Where RowNum=@FirstRow
			
		SELECT RowNum, ID=mwHID, Name=mwName, ItemNumber=mwItemNumber, CategoryName, Direction=mwDirection, QtyOnHand=mwQty, QtyCheckedOut=mwQtyx, RecordCount
		 FROM #SearchResults
			Where RowNum Between @FirstRow And @LastRow     				
		
End

