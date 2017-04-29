CREATE PROCEDURE [dbo].[spMaterial_Save](
@mwHID int = -1,
@iDB varchar(20) = 'MW',
@mwPartNumber varchar(50) = NULL,
@mwRevision varchar(50) = NULL,
@mwWorkOrder varchar(50) = NULL,
@mwType varchar(50) = NULL,
@mwSize varchar(50) = NULL,
@mwQty decimal(10,2) = NULL,
@mwUnit varchar(50) = NULL,
@mwLocation varchar(50) = NULL,
@mwAms varchar(50) = NULL,
@mwHeatLot varchar(50) = NULL,
@mwVendorID int = NULL,
@mwComment varchar(1000) = NULL
) AS
BEGIN
 IF @iDB='MW' AND @mwHID IS NOT NULL AND @mwHID > 0 UPDATE dbo.MWMaterial SET mwPartNumber=@mwPartNumber,mwRevision=@mwRevision,
  mwWorkOrder=@mwWorkOrder,mwType=@mwType,mwSize=@mwSize,mwQty=@mwQty,mwUnit=@mwUnit,
  mwLocation=@mwLocation,mwAms=@mwAms,mwHeatLot=@mwHeatLot,mwVendorID=@mwVendorID,mwComment=@mwComment
  WHERE mwHID=@mwHID;
ELSE IF @iDB='MW' INSERT INTO dbo.MWMaterial (mwPartNumber,mwRevision,mwWorkOrder,mwType,mwSize,mwQty,mwUnit,mwLocation,mwAms,mwHeatLot,mwVendorID,mwComment)
 VALUES (@mwPartNumber,@mwRevision,@mwWorkOrder,@mwType,@mwSize,@mwQty,@mwUnit,@mwLocation,@mwAms,@mwHeatLot,@mwVendorID,@mwComment);
ELSE IF @iDB='WIP' AND EXISTS(SELECT HID FROM dbo.MWMaterialWIP WHERE HID=@mwHID) UPDATE dbo.MWMaterialWIP SET Qty=@mwQty,Unit=@mwUnit,Location=@mwLocation WHERE HID=@mwHID;
ELSE IF @iDB='WIP' INSERT INTO dbo.MWMaterialWIP (HID,Qty,Unit,Location) VALUES (@mwHID,@mwQty,@mwUnit,@mwLocation);
END