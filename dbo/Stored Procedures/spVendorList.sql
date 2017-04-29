CREATE PROCEDURE [dbo].[spVendorList](@CatID int) AS
BEGIN
 SELECT HID,CompanyName FROM proWIP.dbo.fnCompanyList('Supplier',NULL,@CatID,0)
 ORDER by CompanyName;
END
