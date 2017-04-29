
-- [[spGetSSPRevisions] '','FIXTURE'
CREATE PROCEDURE [dbo].[spGetSSPRevisions]
	@SearchTerm	varchar(100),
	@PartId	int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT distinct [Revision] From [dbo].[SetUpSheet] with (nolock) 
		where ([Revision] like '%' + @SearchTerm OR [Revision] like '%' + @SearchTerm + '%')
		and PartId = @PartId
		order by [Revision]
END


