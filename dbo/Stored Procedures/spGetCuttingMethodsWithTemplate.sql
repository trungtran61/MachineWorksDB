-- spGetCuttingMethodsWithTemplate ''
create PROCEDURE [dbo].spGetCuttingMethodsWithTemplate
(
	@SearchTerm varchar(50)=null
	) AS
BEGIN

	Select * From [MachineWork].[dbo].[Cutting_Method_Template](nolock) 
 	WHERE [CuttingMethod] like '%' + @SearchTerm + '%' Or @SearchTerm is null
END