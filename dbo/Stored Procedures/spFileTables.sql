CREATE PROCEDURE [dbo].[spFileTables](@WO nvarchar(50), @PN nvarchar(50), @RV nvarchar(50)) AS
BEGIN
-- IF NOT EXISTS(SELECT mwHID FROM MWMaterial WHERE mwWorkOrder=@WO AND mwPartNumber=@PN AND mwRevision=@RV)
--  INSERT INTO MWMaterial (mwWorkOrder,mwPartNumber,mwRevision) VALUES (@WO,@PN,@RV)

 IF NOT EXISTS(SELECT mwHID FROM MWBluePrint WHERE mwWorkOrder=@WO AND mwPartNumber=@PN AND mwRevision=@RV)
  INSERT INTO MWBluePrint (mwWorkOrder,mwPartNumber,mwRevision) VALUES (@WO,@PN,@RV)

 DECLARE @CPO nvarchar(50)
 SELECT @CPO = mwCustomerPO FROM MWCheckList WHERE mwWorkOrder=@WO AND mwPartNumber=@PN AND mwRevision=@RV
 IF @CPO IS NOT NULL AND @CPO <> '''' AND NOT EXISTS(SELECT mwCustomerPO FROM MWCustomerPO WHERE mwCustomerPO=@CPO)
  INSERT INTO MWCustomerPO (mwCustomerPO) VALUES (@CPO)
END

