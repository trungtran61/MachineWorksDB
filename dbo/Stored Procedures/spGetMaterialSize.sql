-- spGetMaterialSize '', 'CMI-C,IRON,ROD'
CREATE proc spGetMaterialSize
(
@SearchTerm	varchar(100)=null,
@MaterialType varchar(100)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Distinct mwSize From [dbo].MWMaterials with (nolock) 
		where ((mwSize like '%' + @SearchTerm + '%') Or @SearchTerm is null)
		And mwSize <> '' And mwSize is not null
		And mwType = @MaterialType
		Order by mwSize
END
