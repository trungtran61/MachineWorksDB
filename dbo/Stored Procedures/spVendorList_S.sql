CREATE PROCEDURE [dbo].[spVendorList_S](@HID int) AS
BEGIN
 DECLARE @VID int, @CatID int; SELECT @VID=mwVendorID,@CatID=mwCategoryID FROM dbo.MWToolInventory WHERE mwHID=@HID;
 SELECT TOP 1 @VID mwHID,CompanyName mwVendorName,TypeName mwVendorType,AddressID mwAddressID,
  Address1 mwAddress1, Address2 mwAddress2, City mwCity,State mwState,Zip mwZip,Country mwCountry,
  Phone mwPhone,Fax mwFax,Cell mwCell,TollFree mwTollFree,Email mwEmail,Website mwWebsite
 FROM proWIP.dbo.vwCommunication WHERE Item='PO' AND CpyID=@VID AND TypeID=@CatID;
END
