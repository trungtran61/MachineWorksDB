CREATE proc spGetMaterialType
(
@SearchTerm	varchar(100)=null
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Distinct mwType From [dbo].MWMaterials with (nolock) 
		where ((mwType like '%' + @SearchTerm + '%') Or @SearchTerm is null)
		And mwType <> '' And mwType is not null
		Order by mwType
END
