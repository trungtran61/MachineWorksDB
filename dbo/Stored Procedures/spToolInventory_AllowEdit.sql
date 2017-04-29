﻿CREATE PROCEDURE [dbo].[spToolInventory_AllowEdit](@HID int) AS
BEGIN
 SELECT CASE WHEN EXISTS(SELECT HID FROM proWIP.dbo.vwPO WHERE HID IN (SELECT POID FROM dbo.MWToolInventory WHERE mwHID=@HID))
 THEN CAST(0 as bit) ELSE CAST(1 as bit) END allowedEdit;
END