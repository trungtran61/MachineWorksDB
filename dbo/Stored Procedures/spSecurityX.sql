CREATE PROCEDURE [dbo].[spSecurityX](@UN nvarchar(50), @App nvarchar(50)) AS
BEGIN
 IF EXISTS(SELECT * FROM MWGroup WHERE mwUserName=@UN AND mwGroup='Admin') SELECT -1 mwX
 ELSE IF NOT EXISTS(SELECT * FROM MWGroup WHERE mwUserName=@UN) SELECT 0 mwX
 ELSE SELECT ISNULL(MAX(mwLevel),1) mwX FROM MWSecurityGrp WHERE mwApp=@App AND mwGroup IN (SELECT mwGroup FROM MWGroup WHERE mwUserName=@UN)
END
