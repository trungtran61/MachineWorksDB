CREATE VIEW [dbo].[vwMaterial] AS
SELECT t1.*,t2.mwCustomerName,t3.mwVendorName,t5.mwPhone, 
  CASE WHEN EXISTS(SELECT DISTINCT mwLinkID FROM MWFileLnk WHERE mwLinkDB='MWMaterial' AND mwLinkID=t1.mwHID) THEN 'Yes' ELSE 'No' END mwCert,0 WOID,'MW' iDB
 FROM dbo.MWMaterial t1
 LEFT OUTER JOIN (SELECT x1.mwWorkOrder,x2.mwCustomerName FROM MWCheckList x1 LEFT JOIN MWCustomer x2 ON x1.mwCustomerID = x2.mwHID) t2 ON t2.mwWorkOrder = t1.mwWorkOrder
 LEFT OUTER JOIN MWVendors t3 ON t3.mwHID = t1.mwVendorID
 LEFT OUTER JOIN MWAddress t5 ON t5.mwHID = t3.mwAddressID

UNION

 SELECT distinct s1.HID,s5.PartNumber,s5.Revision,s2.WorkOrder,s1.[Type],s1.[Size],ISNULL(s6.Qty,0),ISNULL(s6.Unit,s1.Unit),ISNULL(s6.Location,''),s1.Ams,s1.HeatLot,s3.HID VendorID,'N/A',
 s3.CompanyName,s1.CompanyName,'N/A',CASE WHEN s1.CertNo='NA' THEN 'No' ELSE 'Yes' END,s1.WorkOrderID,'WIP'
 FROM proWIP.dbo.vwMaterial_Count s1
 INNER JOIN proWIP.dbo.WorkOrder s2 ON s1.WorkOrderID=s2.HID
 INNER JOIN proWIP.dbo.Communication_Company s3 ON s3.HID=s2.CustomerID
 --INNER JOIN proWIP.dbo.Communication_Contact s4 ON s4.ComID=s3.HID
 INNER JOIN proWIP.dbo.PartNumber s5 ON s2.PartID=s5.HID
 LEFT OUTER JOIN MachineWork.dbo.MWMaterialWIP s6 ON s6.HID=s1.HID;