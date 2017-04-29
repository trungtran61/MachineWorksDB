/****** Script for SelectTopNRows command from SSMS  ******/
-- [spGetToolInventoryColumnsByCode] 'Code1'
CREATE Proc [dbo].[spGetToolInventoryColumnsByCode]
(
@Code			varchar(30)
)
As
Begin

--Set NoCount On

SELECT [ColumnName]
      ,[ColumnHeader]      
	  ,Show = 0	  
Into #Results 		
  FROM [MachineWork].[dbo].[MWToolInventoryColumns] c (nolock)
  Where ColumnHeader <> '' And ColumnHeader <> 'Code'

Update #Results
Set Show = 1		
  FROM #Results c (nolock)
  Inner Join MWToolInventoryCodeColumn cc (nolock) On cc.ColumnName=c.ColumnName
	Where cc.Code=@Code

Select * from #Results

End

/*
select * from  [MachineWork].[dbo].[MWToolInventoryColumns] c (nolock)
  Inner Join MWToolInventoryCodeColumns cc (nolock) On cc.Columns like '%' + c.ColumnName + '%'
	Where cc.Code='Code1'

*/