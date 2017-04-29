CREATE PROCEDURE spNote (@WO nvarchar(50), @N nvarchar(4000)) AS
BEGIN
 IF EXISTS(SELECT mwHID FROM MWCheckList_Note WHERE mwWorkOrder=@WO)
  UPDATE MWCheckList_Note SET mwNote=@N WHERE mwWorkOrder=@WO
 ELSE
  INSERT INTO MWCheckList_Note (mwWorkOrder,mwNote) VALUES (@WO,@N)
END