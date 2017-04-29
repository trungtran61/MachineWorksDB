CREATE PROCEDURE [dbo].[spUser_RouterCreator_S] AS
SELECT NULL mwUserName,NULL mwName UNION
 SELECT mwUserName,mwName FROM dbo.MWUser
 WHERE mwTitle='Router Creator' AND mwActive=1 ORDER BY mwName;
