CREATE PROCEDURE [dbo].[spEmployee_S] AS
 SELECT NULL mwEmployeeID,NULL mwFullName UNION
 SELECT mwEmployeeID,mwFirstName + ', ' + substring(mwLastName,1,1) mwFullName FROM dbo.MWEmployees
 WHERE mwActive='Yes' ORDER BY mwFullName;