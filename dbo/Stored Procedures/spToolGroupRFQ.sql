CREATE PROCEDURE [dbo].[spToolGroupRFQ](@HID int) AS
BEGIN
 SELECT ToolGroupNum,dbo.fnToolDesc(@HID) [Desc] FROM dbo.MWToolInventory WHERE mwHID=@HID;
END
