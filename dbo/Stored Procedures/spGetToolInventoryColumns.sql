/****** Script for SelectTopNRows command from SSMS  ******/
Create Proc [dbo].[spGetToolInventoryColumns]
As
Begin

Set NoCount On

SELECT [ColumnName]
      ,[ColumnHeader]
      ,[Searchable]
      ,[Sequence]=IsNull([Sequence],0)
      ,[RelatedTable]=IsNull([RelatedTable],'')
      ,[RelatedIDField]=IsNull([RelatedIDField],'')
      ,[RelatedTextField]=IsNull([RelatedTextField],'')
  FROM [MachineWork].[dbo].[MWToolInventoryColumns] (nolock)
  Where ColumnHeader <> '' Order By Sequence

End