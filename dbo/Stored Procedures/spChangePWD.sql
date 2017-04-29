CREATE PROCEDURE [dbo].[spChangePWD](@UN nvarchar(50), @oPWD nvarchar(20), @nPWD nvarchar(20)) AS
BEGIN
 IF EXISTS(SELECT mwUserName FROM dbo.MWUser WHERE mwUserName=@UN AND mwPassword=@oPWD COLLATE SQL_Latin1_General_CP1_CS_AS) BEGIN
  UPDATE dbo.MWUser SET mwPassword=@nPWD,mwPasswordDate=getdate() WHERE mwUserName=@UN;
  SELECT 1 isGood;
 END SELECT 0 isGood;
END
