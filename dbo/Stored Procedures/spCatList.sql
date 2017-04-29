CREATE PROCEDURE [dbo].[spCatList](@UN nvarchar(50), @CD nvarchar(50)) AS
BEGIN
EXEC spSecurityCatA_Insert
DECLARE @tbl TABLE (mwCatID int, mwCatName nvarchar(100))
INSERT INTO @tbl (mwCatID,mwCatName) VALUES (0,'Pick One')
IF EXISTS(SELECT mwUserName FROM MWGroup WHERE mwUserName=@UN AND mwGroup='Admin')
 INSERT INTO @tbl SELECT DISTINCT t1.mwCatID,t2.mwCatName FROM MWSecurityCatA t1
 INNER JOIN MWToolInventory_Category t2 ON t1.mwCatID = t2.mwHID ORDER BY t2.mwCatName
ELSE
BEGIN
 INSERT INTO @tbl SELECT DISTINCT t1.mwCatID,t2.mwCatName FROM MWSecurityCatA t1
 INNER JOIN MWToolInventory_Category t2 ON t1.mwCatID = t2.mwHID
 INNER JOIN (SELECT mwCatID,MAX(mwLevel) mwLevel FROM MWSecurityCatG WHERE mwGroup IN (SELECT mwGroup FROM MWGroup WHERE mwUserName=@UN) GROUP BY mwCatID) t3 ON t1.mwCatID = t3.mwCatID
 WHERE t1.mwKey=@CD AND t1.mwLevel <= t3.mwLevel
 ORDER BY t2.mwCatName
END
SELECT * FROM @tbl
END