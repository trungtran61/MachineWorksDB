CREATE VIEW [dbo].[vwVendors] AS
SELECT t1.*,t2.mwAddress1,t2.mwAddress2,t2.mwCity,t2.mwState,t2.mwZip,t2.mwCountry,
t2.mwPhone,t2.mwFax,t2.mwCell,t2.mwTollFree,t2.mwEmail,t2.mwWebsite
FROM MWVendors t1 LEFT JOIN MWAddress t2 ON t1.mwAddressID = t2.mwHID