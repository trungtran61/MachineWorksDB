CREATE PROCEDURE [dbo].[spCatKey](@UN nvarchar(50), @CID int) AS
BEGIN
 EXEC spSecurityCatA_Insert
 DECLARE @tbl TABLE (mwV bit, mwN bit, mwE bit, mwD bit)
 IF EXISTS(SELECT mwUserName FROM MWGroup WHERE mwUserName=@UN AND mwGroup='Admin')
  INSERT INTO @tbl (mwV,mwN,mwE,mwD) VALUES (1,1,1,1)
 ELSE
 BEGIN
  DECLARE @mwMax int
  DECLARE @mwV bit
  DECLARE @mwN bit
  DECLARE @mwE bit
  DECLARE @mwD bit
  SELECT @mwMax = ISNULL(MAX(mwLevel),0) FROM MWSecurityCatG WHERE mwCatID=@CID AND mwGroup IN (SELECT mwGroup FROM MWGroup WHERE mwUserName=@UN)
  SELECT @mwV = CASE WHEN mwLevel > @mwMax THEN 0 ELSE 1 END FROM MWSecurityCatA WHERE mwCatID=@CID AND mwKey='View'
  SELECT @mwN = CASE WHEN mwLevel > @mwMax THEN 0 ELSE 1 END FROM MWSecurityCatA WHERE mwCatID=@CID AND mwKey='New'
  SELECT @mwE = CASE WHEN mwLevel > @mwMax THEN 0 ELSE 1 END FROM MWSecurityCatA WHERE mwCatID=@CID AND mwKey='Edit'
  SELECT @mwD = CASE WHEN mwLevel > @mwMax THEN 0 ELSE 1 END FROM MWSecurityCatA WHERE mwCatID=@CID AND mwKey='Delete'
  IF @mwV IS NULL SET @mwV=0
  IF @mwN IS NULL SET @mwN=0
  IF @mwE IS NULL SET @mwE=0
  IF @mwD IS NULL SET @mwD=0
  INSERT INTO @tbl (mwV,mwN,mwE,mwD) VALUES (@mwV,@mwN,@mwE,@mwD)
 END
 SELECT * FROM @tbl
END