CREATE PROCEDURE [dbo].[spProcessType_S1] AS
BEGIN
 SELECT t1.HID,t1.[Name],
 CASE WHEN t2.HID IS NOT NULL THEN CAST(1 as bit) ELSE CAST(0 as bit) END isSelected,
 CASE WHEN t3.PID IS NOT NULL THEN CAST(0 as bit) ELSE CAST(1 as bit) END isEnabled
 FROM (SELECT HID,[Name] FROM proWIP.dbo.Process_Type WHERE isActive=1) t1
 LEFT OUTER JOIN dbo.ProcessType t2 ON t1.HID=t2.HID
 LEFT OUTER JOIN (SELECT DISTINCT mwCategoryID PID FROM dbo.MWToolInventory WHERE mwCategoryID IS NOT NULL) t3 ON t1.HID=t3.PID
 ORDER BY t1.[Name];
END
