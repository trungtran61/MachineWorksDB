CREATE PROCEDURE [dbo].[spSecurityCatA_Insert] AS
BEGIN
 DECLARE @CatID INT
 DECLARE @temp TABLE (mwHID INT, mwYN BIT)
 INSERT INTO @temp SELECT mwHID,0 mwYN FROM MWToolInventory_Category
 WHILE EXISTS(SELECT * FROM @temp WHERE mwYN=0)
 BEGIN
  SELECT TOP 1 @CatID = mwHID FROM @temp WHERE mwYN=0
  IF NOT EXISTS(SELECT mwCatID FROM MWSecurityCatA WHERE mwCatID=@CatID AND mwKey='View')
   INSERT INTO MWSecurityCatA (mwCatID,mwKey,mwValue,mwLevel) VALUES (@CatID,'View','View',1)
  IF NOT EXISTS(SELECT mwCatID FROM MWSecurityCatA WHERE mwCatID=@CatID AND mwKey='New')
   INSERT INTO MWSecurityCatA (mwCatID,mwKey,mwValue,mwLevel) VALUES (@CatID,'New','New',1)
  IF NOT EXISTS(SELECT mwCatID FROM MWSecurityCatA WHERE mwCatID=@CatID AND mwKey='Edit')
   INSERT INTO MWSecurityCatA (mwCatID,mwKey,mwValue,mwLevel) VALUES (@CatID,'Edit','Edit',1)
  IF NOT EXISTS(SELECT mwCatID FROM MWSecurityCatA WHERE mwCatID=@CatID AND mwKey='Delete')
   INSERT INTO MWSecurityCatA (mwCatID,mwKey,mwValue,mwLevel) VALUES (@CatID,'Delete','Delete',1)
  UPDATE @temp SET mwYN=1 WHERE mwHID=@CatID
 END
END