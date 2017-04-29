CREATE FUNCTION [dbo].[getToolNet](@ToolID int, @d1 datetime, @d2 datetime, @d3 datetime) RETURNS decimal(10,2) AS
BEGIN
 DECLARE @avg1 decimal(10,2), @avg3 decimal(10,2);
 SELECT @avg3=AVG(-1*QtyNet) FROM proMOGT.dbo.ToolTracking WHERE ActType='CheckOut' AND ToolID=@ToolID AND ActDate BETWEEN @d1 AND @d3;
 SELECT @avg1=AVG(-1*QtyNet) FROM proMOGT.dbo.ToolTracking WHERE ActType='CheckOut' AND ToolID=@ToolID AND ActDate BETWEEN @d2 AND @d3;
 RETURN (SELECT CASE WHEN @avg1 > @avg3 THEN @avg1 ELSE @avg3 END);
END

