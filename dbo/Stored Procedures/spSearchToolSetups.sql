CREATE PROCEDURE [dbo].spSearchToolSetups 
(
@SearchTerm varchar(50)
) AS
BEGIN
Set NoCount On

Select ID, SpecialComment, GroupType='item' From [ToolSetup] 
	Where  SpecialComment like '%' + @SearchTerm + '%'
Union
Select tsg.MainToolSetupId, SpecialComment, GroupType='group' From [ToolSetupGroup] tsg
	Inner Join [ToolSetup] ts on ts.ID=tsg.MainToolSetupId
	Where  SpecialComment like '%' + @SearchTerm + '%'

END
