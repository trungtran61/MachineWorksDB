creATE PROC SplitStringIntoRows
(
@sStrings varchar(max)
,@delimiter char(1)
)
AS
BEGIN
DECLARE @iCommaPos int
      ,@sString varchar(100)
 
SET NOCOUNT ON
 
Declare @Strings TABLE
(
  sString varchar(100)
)
 
SET @iCommaPos = CHARINDEX(@delimiter, @sStrings)
IF @iCommaPos = 0
      INSERT @Strings VALUES(@sStrings)
 
WHILE @iCommaPos > 0
BEGIN
      SET @iCommaPos = CHARINDEX(@delimiter, @sStrings)
     
      IF @iCommaPos > 0
      BEGIN
            SET @sString = SUBSTRING(@sStrings, 1, @iCommaPos - 1)           
            SET @sStrings = SUBSTRING(@sStrings, @iCommaPos +1, LEN(@sStrings) - @iCommaPos)           
      END
      ELSE
            SET @sString = @sStrings                 
      IF @sString <> ''
            INSERT @Strings VALUES(@sString)
END  
 
SELECT * FROM @Strings

end