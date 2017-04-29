/****** Script for SelectTopNRows command from SSMS  ******/
-- [spAddToolSetupSheet]

CREATE Proc [dbo].[spAddToolSetupSheet]
(
@UserName varchar(50),
@MachineType	varchar(20)
)
As
Begin

	Set NoCount On
  
 Insert dbo.ToolSetupSheet (MachineType, Machine,Created, CreatedBy)
	values (@MachineType,@MachineType, GetDate(), @UserName)

Select SCOPE_IDENTITY()
 
End 
