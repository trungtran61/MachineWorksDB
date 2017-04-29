CREATE PROCEDURE [dbo].[spSecCatG_Update](@Grp nvarchar(50), @CID int, @Lvl int) AS
BEGIN
 IF EXISTS(SELECT mwHID FROM MWSecurityCatG WHERE mwGroup=@Grp AND mwCatID=@CID)
  UPDATE MWSecurityCatG SET mwLevel=@Lvl WHERE mwGroup=@Grp AND mwCatID=@CID
 ELSE
  INSERT INTO MWSecurityCatG (mwGroup,mwCatID,mwLevel) VALUES (@Grp,@CID,@Lvl)
END