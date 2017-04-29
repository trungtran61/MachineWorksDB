CREATE PROCEDURE [dbo].[spMaterial_D](@mwHID int, @iDB varchar(20) = 'MW') AS
BEGIN
 IF @iDB='MW' DELETE FROM dbo.MWMaterial WHERE mwHID=@mwHID;
END
