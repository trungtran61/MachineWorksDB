CREATE PROCEDURE [dbo].[spProcessType_S] AS
BEGIN
 SELECT 0 HID,'Pick One' [Name],0 SortOrder
 UNION
 SELECT HID,[Name],1 FROM dbo.vwProcessType ORDER BY SortOrder,[Name];
END
