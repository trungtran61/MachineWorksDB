CREATE FUNCTION [dbo].[getHolder](@mwParentID INT) RETURNS @tbl TABLE
(mwHID int, mwName nvarchar(100), mwMWID nvarchar(20), mwCode nvarchar(50), mwMaterial nvarchar(50), mwGrade nvarchar(50),
mwQty int, mwLocation nvarchar(100), mwExtLocation nvarchar(100), mwComment nvarchar(255), mwFN nvarchar(1000), mwYN bit)
AS
BEGIN
 INSERT INTO @tbl
 SELECT mwHID,mwName,mwMWID,mwCode,mwMaterial,mwGrade,mwQty,mwLocation,mwExtLocation,mwComment,'' mwFN, cast(0 as bit) mwYN
 FROM MWToolInventory WHERE mwHID IN
 (SELECT mwChildID FROM MWLinkedTool WHERE mwLinkCode='Tool2Tool' AND mwParentID=@mwParentID)

 DECLARE @mwHID INT
 DECLARE @mwFN nvarchar(1000)
 WHILE EXISTS(SELECT * FROM @tbl WHERE mwYN=0)
 BEGIN
  SET @mwFN = 'NotAvailable.jpg'
  SELECT TOP 1 @mwHID = mwHID FROM @tbl WHERE mwYN=0
  SELECT TOP 1 @mwFN = ISNULL(mwFolder + mwFileName,'NotAvailable.jpg') FROM MWImage WHERE mwCode='ToolInventory' AND mwCodeID=@mwHID
  UPDATE @tbl SET mwYN=1,mwFN=@mwFN WHERE mwHID=@mwHID
 END

 RETURN
END