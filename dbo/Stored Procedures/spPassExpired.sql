CREATE PROCEDURE [dbo].[spPassExpired](@UN nvarchar(50)) AS
BEGIN
 SELECT CASE WHEN datediff(dd,mwPasswordDate,getdate()) > mwPasswordExpire THEN 1 ELSE 0 END isExpired
  FROM dbo.MWUser WHERE mwUserName=@UN;
END