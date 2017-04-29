CREATE PROCEDURE [dbo].[spSecurityY](@App nvarchar(50), @Pge nvarchar(50), @k nvarchar(50), @v nvarchar(50)) AS
BEGIN
 IF NOT EXISTS(SELECT * FROM MWSecurityApp WHERE mwApp=@App AND mwPage=@Pge AND mwKey=@k)
  INSERT INTO MWSecurityApp (mwApp,mwPage,mwKey,mwValue,mwLevel) VALUES (@App,@Pge,@k,@v,0)
 SELECT mwLevel FROM MWSecurityApp WHERE mwApp=@App AND mwPage=@Pge AND mwKey=@k
END

--------------

SET ANSI_NULLS ON
