
-- [spGetSSPPartNumbers] ''
CREATE PROCEDURE [dbo].[spGetSSPPartNumbers]
	@SearchTerm	varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	/*
	SELECT PartNumber,Revision,HID 
		From proWIP.dbo.[PartNumber] with (nolock) 
		where [PartNumber] like '%' + @SearchTerm + '%'		
	
	
	UNION
	*/
	SELECT Distinct [PartNumber] From [dbo].ToolSetUpSheet with (nolock) 
		where [PartNumber] like '%' + @SearchTerm + '%'
		order by [PartNumber]		
	END




