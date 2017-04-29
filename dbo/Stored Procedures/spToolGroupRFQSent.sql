CREATE PROCEDURE [dbo].[spToolGroupRFQSent](@HID int) AS
BEGIN
 DECLARE @TGN int; SELECT @TGN=ToolGroupNum FROM dbo.MWToolInventory WHERE mwHID=@HID;
 UPDATE dbo.MWToolInventory SET isSent=1 WHERE ToolGroupNum=@TGN;
END
