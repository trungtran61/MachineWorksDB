CREATE VIEW [dbo].[vwProcessType] AS
 SELECT t1.HID,t2.ProcessID,t2.[Name] FROM 
 dbo.ProcessType t1
 INNER JOIN proWIP.dbo.Process_Type t2 ON t1.HID=t2.HID AND t2.isActive=1;
