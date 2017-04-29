CREATE PROCEDURE [dbo].[spExpAcctList] AS
BEGIN
 SELECT '' tExpAcct UNION
 SELECT t2.mText FROM
 (
  SELECT s2.HID,s2.DefAcct
  FROM (SELECT DISTINCT mwCategoryID FROM dbo.MWToolInventory WHERE mwQty < mwOrderPoint AND mwInvLevel > mwQty) s1
  INNER JOIN (SELECT HID,DefAcct FROM proWIP.dbo.Process_Type WHERE isActive=1 AND HID IN (SELECT HID FROM dbo.ProcessType)) s2 ON s1.mwCategoryID=s2.HID
 ) t1
 INNER JOIN (SELECT mText,mValue FROM proWIP.dbo.DropDownList WHERE Category='ExpAcct') t2 ON t1.DefAcct=t2.mValue
 ORDER BY tExpAcct;
END
