CREATE PROCEDURE [dbo].[spToolOrderList](@HIDs varchar(5000) = NULL, @tExpAcct varchar(50) = NULL, @ItemNum varchar(50) = NULL, @Name varchar(50) = NULL, @Code varchar(50) = NULL, @MWID varchar(50) = NULL, @VendorName varchar(50) = NULL) AS
BEGIN
 DECLARE @enf bit;

 IF EXISTS(SELECT HID FROM proWIP.dbo.Note WHERE Note='Yes' AND HID IN (SELECT nValue FROM proWIP.dbo.Admin_Variables WHERE nKey='EnfTola')) SET @enf=1;
 ELSE SET @enf=0;

 EXEC proWIP.dbo.spBudgetForcast_Refresh NULL;
 SELECT t1.HID,t1.ItemNumber,t1.PackSize,t1.[Name],t1.Code,t1.MWID,t1.OnHand,t1.UnitPrice,t1.OrderQty,t1.UnitPrice*t1.OrderQty Amount,t2.CompanyName VendorName,t2.Phone Phone,t1.Description,t2.tExpAcct,t2.Balance,t2.TypeName,t2.Enforced,
  t1.mwVendorID,t1.mwCategoryID,t1.NewAppDate,t3.RecdDD,t3.lMode,
  CASE WHEN t3.HID IS NOT NULL AND t3.Status='Received' THEN '<span title="' + t3.PONumber + ' received!"><img src="../App_Themes/thumbsUp.png"></span>'
   WHEN t3.HID IS NOT NULL THEN '<span title="' + t3.PONumber + ' Created!">&#x2713;</span>' ELSE '' END +
  CASE WHEN ISNULL(t2.CompanyName,'') = '' THEN '<span title="Vendor Name is required!">V</span>' ELSE '' END +
  CASE WHEN ISNULL(t1.ItemNumber,'') = '' THEN '<span title="Item Number is required!">I</span>' ELSE '' END +
  CASE WHEN ISNULL(t2.Email,'') = '' THEN '<span title="Email is required!">E</span>' ELSE '' END +
  CASE WHEN ISNULL(t1.UnitPrice,0) <= 0 THEN '<span title="Unit Price is required!">U</span>' ELSE '' END +
  CASE WHEN t2.tExpAcct IS NULL THEN '<span title="Expense Account is required!">X</span>'
   WHEN t2.Enforced=1 AND ISNULL(t2.Balance,0) <= 0 THEN '<span title="'+ ISNULL(t2.Note,'OVER LIMIT!!!') + '">X</span>' ELSE '' END eCode,
  CASE WHEN @enf=1 THEN ISNULL(t1.OrderApproved,1) ELSE 0 END ordApp
 FROM (
  SELECT OrderApproved,NewAppDate,mwHID HID,POID,mwVendorID,mwItemNumber ItemNumber,PackSize,mwName [Name],mwCode Code,mwMWID MWID,mwQty OnHand,mwUnitPrice UnitPrice,CEILING((mwInvLevel-mwQty)/PackSize) OrderQty,mwCategoryID,dbo.fnToolDesc(mwHID) Description
  FROM dbo.MWToolInventory
  WHERE (@HIDs IS NULL OR mwHID IN (SELECT Val FROM proWIP.dbo.fnSplit(@HIDs,':')))
  AND (@ItemNum IS NULL OR mwItemNumber LIKE @ItemNum)
  AND (@Name IS NULL OR mwName LIKE @Name)
  AND (@Code IS NULL OR mwCode LIKE @Code)
  AND (@MWID IS NULL OR mwMWID LIKE @MWID)
  AND mwQty < mwOrderPoint AND mwInvLevel > mwQty
 ) t1
 LEFT OUTER JOIN (
  SELECT * FROM (SELECT s1.CpyID,s1.TypeID,s1.TypeName,s1.CompanyName,s1.Phone,s1.Email,s3.tExpAcct,s3.Enforced,s3.LimAmt-s3.CurAmt Balance,
  CASE WHEN s3.CurAmt>=s3.LimAmt THEN s3.Note ELSE '' END Note,ROW_NUMBER() OVER(PARTITION BY s1.CpyID,s1.TypeID ORDER BY s1.CpyID DESC) rn
  FROM (SELECT * FROM proWIP.dbo.vwCommunication WHERE Item='PO') s1
  LEFT OUTER JOIN proWIP.dbo.fnBudgetForcast(NULL) s3 ON s1.ExpAcct=s3.ExpAcct) a WHERE rn=1
 ) t2 ON t1.mwVendorID=t2.CpyID AND t1.mwCategoryID=t2.TypeID
 LEFT OUTER JOIN (SELECT HID,PONumber,Status,RecdDD,proWIP.dbo.fnLateMode(-2,-2,getdate(),RecdDD,default) lMode FROM proWIP.dbo.vwPO) t3 ON t1.POID=t3.HID
 WHERE (@tExpAcct IS NULL OR @tExpAcct=t2.tExpAcct)
 AND (@VendorName IS NULL OR t2.CompanyName LIKE @VendorName);
END
