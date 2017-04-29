CREATE PROCEDURE [dbo].[spProcessType_Save](@HIDs varchar(5000)) AS
BEGIN
 DELETE FROM dbo.ProcessType;
 INSERT INTO dbo.ProcessType(HID) SELECT Val FROM proWIP.dbo.fnSplit(@HIDs,':');
END
