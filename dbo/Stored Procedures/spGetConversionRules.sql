-- [spGetConversionRules] 'D01','D02'
CREATE Proc [dbo].[spGetConversionRules]
(
@FromMachineId	varchar(20)=null,
@ToMachineId	varchar(20)=null
)
As
Begin

Set NoCount On

Select * From [ConversionRules] (nolock) 
	Where (FromMachineId=@FromMachineId Or @FromMachineId is null) And 
		(ToMachineId=@ToMachineId Or @ToMachineId is null)

End

