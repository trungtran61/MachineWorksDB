Create proc [dbo].[spGetLookupValues]
(
@Category		varchar(100)=null
,@SearchTerm	varchar(100)=null
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT ID=HID,Name=mValue,Description=mText, SortOrder 
	FROM proWIP.dbo.DropdownList 
	WHERE Category=@Category And
		(mValue like '%' + @SearchTerm + '%' Or mText like '%' + @SearchTerm + '%' Or @SearchTerm is null)
	
END

