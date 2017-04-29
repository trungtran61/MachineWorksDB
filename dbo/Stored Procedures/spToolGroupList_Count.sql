CREATE PROCEDURE [dbo].[spToolGroupList_Count](@TGN int = NULL, @ItemNumber varchar(50) = NULL, @VendorName varchar(50) = NULL) AS
BEGIN
 DECLARE @tbl TABLE (HID int, TGN int, ItemNumber varchar(50), Description varchar(2000), UnitPrice decimal(8,2), PackSize decimal(8,2), Price decimal(8,2), Status varchar(50), VID int, CompanyName varchar(50), Phone varchar(50), isSent bit);
 INSERT INTO @tbl EXEC dbo.spToolGroupList @TGN,@ItemNumber,@VendorName;
 SELECT COUNT(TGN) FROM (select DISTINCT TGN from @tbl) a;
END
