CREATE PROCEDURE spDelivery_Update(@WO nvarchar(50)) AS
BEGIN
 IF EXISTS(SELECT mwWorkOrder FROM MWCheckList_Department WHERE mwWorkOrder=@WO AND mwDepartment='Delivery')
 BEGIN
  UPDATE MWCheckList_Department SET mwStatus='Yes' WHERE mwWorkOrder=@WO AND mwDepartment='Delivery' AND mwTask='GET CONFIRMED' AND mwStatus='No'
  UPDATE MWCheckList_Department SET mwStatus='Yes' WHERE mwWorkOrder=@WO AND mwDepartment='Delivery' AND mwTask='SCAN CONFIRMED' AND mwStatus='No'
  UPDATE MWCheckList SET mwCurDept='Billing' WHERE mwWorkOrder=@WO AND mwCurDept='Delivery'
 END
END