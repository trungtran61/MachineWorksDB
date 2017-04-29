CREATE PROCEDURE [dbo].[spToolInventorySearch](@preText varchar(100), @field varchar(100)) AS
BEGIN
 IF @field='Code' SELECT TOP 20 mwCode valList FROM dbo.MWToolInventory WHERE mwCode LIKE @preText + '%' ORDER BY mwCode;
END
