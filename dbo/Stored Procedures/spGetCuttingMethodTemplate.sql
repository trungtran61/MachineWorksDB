/****** Script for SelectTopNRows command from SSMS  ******/
-- [spGetCuttingMethodTemplate] 'DRILL'
CREATE proc [dbo].[spGetCuttingMethodTemplate]
(
@CuttingMethod varchar(50)
)
AS
BEGIN
Set NoCount On

SELECT CuttingMethod
      ,[Template]
  FROM [MachineWork].[dbo].[Cutting_Method_Template]
	  where CuttingMethod=@CuttingMethod
 
 End
 
 
