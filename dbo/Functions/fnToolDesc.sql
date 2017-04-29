CREATE FUNCTION [dbo].[fnToolDesc](@HID int) RETURNS varchar(2000) AS
BEGIN
 RETURN (SELECT
  CASE WHEN mwName IS NOT NULL THEN 'N: ' + mwName ELSE '' END +
  CASE WHEN mwCode IS NOT NULL THEN ', C: ' + mwCode ELSE '' END +
  CASE WHEN mwRadius IS NOT NULL THEN ', R: ' + mwRadius ELSE '' END +
  CASE WHEN mwDiameter IS NOT NULL THEN ', D: ' + mwDiameter ELSE '' END +
  CASE WHEN mwAngle IS NOT NULL THEN ', A: ' + mwAngle ELSE '' END +
  CASE WHEN mwWidth IS NOT NULL THEN ', W: ' + mwWidth ELSE '' END +
  CASE WHEN mwNumofCutter > 0 THEN ', #C: ' + CAST(mwNumofCutter as varchar) ELSE '' END +
  CASE WHEN mwMaxDepthofCut IS NOT NULL THEN ', MDC: ' + mwMaxDepthofCut ELSE '' END +
  CASE WHEN mwNumofFlutes > 0 THEN ', #F: ' + CAST(mwNumofFlutes as varchar) ELSE '' END +
  CASE WHEN mwFluteLength IS NOT NULL THEN ', FL: ' + mwFluteLength ELSE '' END +
  CASE WHEN mwOAL IS NOT NULL THEN ', OAL: ' + mwOAL ELSE '' END +
  CASE WHEN mwShankDia IS NOT NULL THEN ', SD: ' + mwShankDia ELSE '' END +
  CASE WHEN mwMaterial IS NOT NULL THEN ', M: ' + mwMaterial ELSE '' END +
  CASE WHEN mwGrade IS NOT NULL THEN ', G: ' + mwGrade ELSE '' END +
  CASE WHEN mwChipBreaker IS NOT NULL THEN ', CB: ' + mwChipBreaker ELSE '' END +
  CASE WHEN mwDirection IS NOT NULL THEN ', DIR: ' + mwDirection ELSE '' END Description
 FROM dbo.MWToolInventory WHERE mwHID=@HID);
END
