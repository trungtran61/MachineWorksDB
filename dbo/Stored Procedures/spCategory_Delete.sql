CREATE PROCEDURE [dbo].[spCategory_Delete](@HID int) AS
BEGIN
 IF NOT EXISTS(SELECT mwHID FROM MWToolInventory WHERE mwCategoryID=@HID)
 BEGIN
  DELETE FROM MWSecurityCatA WHERE mwCatID=@HID
  DELETE FROM MWSecurityCatG WHERE mwCatID=@HID
  DELETE FROM MWToolInventory_Category WHERE mwHID=@HID
 END
 ELSE
  RAISERROR ('Please make sure this category is not being used by the inventory database.',16,1)
END