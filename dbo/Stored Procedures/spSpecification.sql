CREATE PROCEDURE [dbo].[spSpecification](@OP INT, @WO nvarchar(50), @PN nvarchar(50), @RV nvarchar(50),
@SO nvarchar(50), @SN nvarchar(50), @DS nvarchar(50), @PP nvarchar(1000), @VID int) AS
BEGIN
 IF EXISTS(SELECT mwHID FROM MWSpecification WHERE mwOP=@OP AND mwWorkOrder=@WO AND mwPartNumber=@PN AND mwRevision=@RV)
 BEGIN
  UPDATE MWSpecification SET mwSpecOwner=@SO,mwSpecNum=@SN,mwDescription=@DS,mwPageParap=@PP,mwVendorID=@VID WHERE mwOP=@OP AND mwWorkOrder=@WO AND mwPartNumber=@PN AND mwRevision=@RV
  SELECT ISNULL(@@IDENTITY,0) AS rID
 END
 ELSE
 BEGIN
  INSERT INTO MWSpecification (mwOP,mwWorkOrder,mwPartNumber,mwRevision,mwSpecOwner,mwSpecNum,mwDescription,mwPageParap,mwVendorID) VALUES (@OP,@WO,@PN,@RV,@SO,@SN,@DS,@PP,@VID)
  SELECT ISNULL(SCOPE_IDENTITY(),0) AS rID
 END
END
