-- spGetLookup 'cuttingmethod'
CREATE PROCEDURE [dbo].[spgetLookup](@Category varchar(50),
	@SearchTerm varchar(50)) AS
BEGIN

	Select * From  [proWIP].[dbo].[DropDownList] (nolock) 
 	WHERE Category=@Category And
		(mValue like '%' + @SearchTerm + '%' Or mText like '%' + @SearchTerm + '%' Or @SearchTerm is null)
END