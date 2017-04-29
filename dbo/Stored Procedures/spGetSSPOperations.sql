
-- [spGetSSPOperations] '','3239537-3-FN2','A'
CREATE PROCEDURE [dbo].[spGetSSPOperations]
	@SearchTerm	varchar(100),
	@PartId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Operation] From [dbo].[SetUpSheet] ss with (nolock) 
		where ([Operation] like '%' + @SearchTerm + '%')
			And ss.PartId=@PartId
		Order by [Operation]
END




