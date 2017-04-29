CREATE PROCEDURE [dbo].[spToolGroupList](@TGN int = NULL, @ItemNumber varchar(50) = NULL, @VendorName varchar(50) = NULL) AS
BEGIN
 DECLARE @tbl TABLE (TGN int);
 DECLARE @pts int; SELECT @pts=nValue FROM proWIP.dbo.Admin_Variables WHERE nKey='TGR';

 WITH tbl AS (SELECT ToolGroupNum,COUNT(mwHID) Cnt FROM 
  (SELECT s1.mwHID,s1.ToolGroupNum FROM dbo.MWToolInventory s1 LEFT OUTER JOIN dbo.MWToolInventory_Status s2 ON s1.mwStatusID=s2.mwHID
   WHERE s1.ToolGroupNum IS NOT NULL AND s2.mwStatus NOT IN ('Obsolete','Testing')
  ) a GROUP BY ToolGroupNum
 ) INSERT INTO @tbl (TGN) SELECT ToolGroupNum FROM tbl WHERE Cnt < @pts AND (@TGN IS NULL OR ToolGroupNum=@TGN);

 SELECT t1.HID,t1.ToolGroupNum,t1.ItemNumber,t1.Description,t1.UnitPrice,t1.PackSize,t1.Price,t1.Status,t1.VID,t2.CompanyName,t2.Phone,t1.isSent
 FROM
 (SELECT s1.mwHID HID,mwVendorID VID,mwItemNumber ItemNumber,PackSize,mwUnitPrice UnitPrice,ToolGroupNum,mwCategoryID CID,s2.mwStatus Status,
   CASE WHEN PackSize <> 0 THEN ISNULL(mwUnitPrice/PackSize,0) ELSE 0 END Price,dbo.fnToolDesc(s1.mwHID) Description,ISNULL(s1.isSent,0) isSent
  FROM dbo.MWToolInventory s1 LEFT OUTER JOIN dbo.MWToolInventory_Status s2 ON s1.mwStatusID=s2.mwHID
   WHERE EXISTS(SELECT TGN FROM @tbl WHERE TGN=s1.ToolGroupNum) AND (@ItemNumber IS NULL OR mwItemNumber LIKE @ItemNumber)
 ) t1
 LEFT OUTER JOIN (
  SELECT * FROM (SELECT s1.CpyID,s1.CompanyName,s1.Phone,s1.TypeID,ROW_NUMBER() OVER(PARTITION BY s1.CpyID,s1.TypeID ORDER BY s1.CpyID DESC) rn
  FROM (SELECT * FROM proWIP.dbo.vwCommunication WHERE Item='PO') s1) a WHERE rn=1
 ) t2 ON t1.VID=t2.CpyID AND t1.CID=t2.TypeID
 WHERE (@VendorName IS NULL OR t2.CompanyName LIKE @VendorName)
 ORDER BY t1.ToolGroupNum;
END

