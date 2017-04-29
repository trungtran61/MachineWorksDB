/****** Script for SelectTopNRows command from SSMS  ******/
-- [spGetCuttingMethodWithTemplate]
Create Proc [dbo].[spGetCuttingMethodWithTemplate]
(
@SearchTerm	varchar(50)=null
)
As
Begin
  
  SELECT ID, Name, Description From vwCuttingMethod cm
  Inner Join Cutting_Method_Template cmt on cm.ID=cmt.CuttingMethodID
		Where (Name like '%' + @SearchTerm + '%' Or @SearchTerm is null)	
		Or (Description like '%' + @SearchTerm + '%' Or @SearchTerm is null)
	ORDER BY SortOrder
  
 
End 

--select * from proWIP.dbo.DropdownList 