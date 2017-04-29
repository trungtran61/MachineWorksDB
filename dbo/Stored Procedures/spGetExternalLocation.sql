/****** Script for SelectTopNRows command from SSMS  ******/
-- [spGetExternalLocation]

CREATE Proc [dbo].[spGetExternalLocation]
(
@SearchTerm	varchar(50)=null
)
As
Begin

	Set NoCount On
  
  SELECT distinct mwExtLocation   
  FROM [MachineWork].[dbo].[MWToolInventory] (nolock)
   where mwExtLocation like '%' + @SearchTerm + '%' Or @SearchTerm is null	
  order by mwExtLocation
 
End 
