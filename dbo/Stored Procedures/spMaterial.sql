CREATE PROCEDURE [dbo].[spMaterial](@WO nvarchar(50), @PN nvarchar(50), @RV nvarchar(50),
@TP nvarchar(50), @SZ nvarchar(50), @UN nvarchar(50), @AM nvarchar(50), @HL nvarchar(50), @VID int) AS
BEGIN
 IF EXISTS(SELECT mwHID FROM MWMaterial WHERE mwWorkOrder=@WO AND mwPartNumber=@PN AND mwRevision=@RV)
 BEGIN
  UPDATE MWMaterial SET mwType=@TP,mwSize=@SZ,mwUnit=@UN,mwAms=@AM,mwHeatLot=@HL,mwVendorID=@VID WHERE mwWorkOrder=@WO AND mwPartNumber=@PN AND mwRevision=@RV
  SELECT ISNULL(@@IDENTITY,0) AS rID
 END
 ELSE
 BEGIN
  INSERT INTO MWMaterial (mwWorkOrder,mwPartNumber,mwRevision,mwType,mwSize,mwUnit,mwAms,mwHeatLot,mwVendorID) VALUES (@WO,@PN,@RV,@TP,@SZ,@UN,@AM,@HL,@VID)
  SELECT ISNULL(SCOPE_IDENTITY(),0) AS rID
 END
END
