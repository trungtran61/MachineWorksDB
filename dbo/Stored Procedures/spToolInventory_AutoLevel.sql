CREATE PROCEDURE spToolInventory_AutoLevel AS
BEGIN
 DECLARE @tbl TABLE(HID int, SetLevel decimal(10,2));
 DECLARE @HID int, @SetLevel decimal(10,2), @d1 datetime, @d2 datetime, @d3 datetime;

 SELECT @d1=DATEADD(mm, DATEDIFF(m,0,GETDATE())-3,0),@d2=DATEADD(mm, DATEDIFF(m,0,GETDATE())-1,0),@d3=DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE()),0));
 INSERT INTO @tbl (HID,SetLevel) SELECT mwHID,dbo.getToolNet(mwHID,@d1,@d2,@d3) FROM dbo.MWToolInventory
  WHERE mwStatusID IN (SELECT mwHID FROM dbo.MWToolInventory_Status WHERE mwStatus='NEW & LOCKED');

 WHILE EXISTS(SELECT HID FROM @tbl) BEGIN
  SELECT TOP 1 @HID=@HID,@SetLevel=SetLevel FROM @tbl;
  UPDATE dbo.MWToolInventory SET mwInvLevel=@SetLevel*1.5,mwOrderPoint=@SetLevel/2 WHERE mwHID=@HID;
  DELETE FROM @tbl WHERE HID=@HID;
 END
END