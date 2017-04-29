
-- usp_GetToolHolder @mwHID = 11651, @ToolHolders = '12938,12939,12940'
CREATE PROC [dbo].[usp_GetToolHolder](
	@mwHID int
	, @ToolHolders varchar(500) = ''	-- mwHID in MWLinkedTool, comma delimited
)
AS
BEGIN
Create Table #ToolHolders
      (
            Column1 int
      )
Insert Into #ToolHolders
            Exec SplitStringIntoRows @ToolHolders, ','

SELECT 0 isParent, ItemName=mw.[mwName],  ISNULL(mw.Description, '') ItemDesc, ISNULL(mw.mwMWID, '') ItemMWID, mw.mwItemNumber ItemNum, mw.mwLocation ItemLocation, i.mwFolder + mwFileName ItemImagePath, mw.mwHID ItemMWHID
FROM MWLinkedTool lt
INNER JOIN #ToolHolders t
	ON lt.mwHID = t.Column1
	AND lt.mwParentID = @mwHID
INNER JOIN MWToolInventory mw
	ON lt.mwChildID = mw.mwHID
LEFT JOIN MWImage i
	ON mw.mwHID = i.mwCodeID
UNION
SELECT 1 isParent,  Item_Name=mw.[mwName], ISNULL(mw.Description, '') ItemDesc, ISNULL(mw.mwMWID, '') ItemMWID, mw.mwItemNumber ItemNum, mw.mwLocation ItemLocation, i.mwFolder + mwFileName ItemImagePath, mw.mwHID ItemMWHID
FROM MWToolInventory mw
LEFT JOIN MWImage i
	ON mw.mwHID = i.mwCodeID
WHERE mw.mwHID = @mwHID
ORDER BY isParent DESC
END