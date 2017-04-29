/****** Script for SelectTopNRows command from SSMS  ******/
-- [spGetSelectedToolInventoryColumns] 'Code1'
CREATE Proc [dbo].[spGetSelectedToolInventoryColumns]
(
@Code			varchar(30),
@searchableOnly bit=0
)
As
Begin

--Set NoCount On

SELECT cc.[ColumnName]
      ,[ColumnHeader] 
	  ,InputType=IsNull(InputType,'INPUT')     	  
	  ,[Sequence]=IsNull([Sequence],0)	  
	  ,UISize
  FROM MWToolInventoryColumns c (nolock)
  Inner Join MWToolInventoryCodeColumn cc (nolock) On cc.ColumnName=c.ColumnName 
  Where cc.Code=@Code
	And (c.Searchable = 1 Or @searchableOnly=0)
	Order By IsNull([Sequence],0)

End
