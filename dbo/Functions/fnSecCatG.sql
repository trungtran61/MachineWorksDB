CREATE FUNCTION [dbo].[fnSecCatG](@Grp nvarchar(50)) RETURNS TABLE AS
RETURN (SELECT DISTINCT t1.mwCatID,t2.mwCatName,ISNULL(t3.mwLevel,0) mwLevel FROM MWSecurityCatA t1
LEFT JOIN MWToolInventory_Category t2 ON t1.mwCatID = t2.mwHID
LEFT JOIN MWSecurityCatG t3 ON t1.mwCatID = t3.mwCatID AND t3.mwGroup=@Grp OR t3.mwGroup IS NULL)