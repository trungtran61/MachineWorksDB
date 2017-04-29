CREATE proc [dbo].[spGetUOM]
(
@SearchTerm	varchar(100)=null
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  SELECT * From vwUOM
		Where (Name like '%' + @SearchTerm + '%' Or @SearchTerm is null)	
		Or (Description like '%' + @SearchTerm + '%' Or @SearchTerm is null)
	ORDER BY SortOrder
END

