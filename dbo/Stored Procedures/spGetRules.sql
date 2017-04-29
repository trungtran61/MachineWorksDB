-- spGetRules 'D01','D02'
CREATE Proc spGetRules
(
@FromMachineId	varchar(20),
@ToMachineId	varchar(20)
)
As
Begin

Set NoCount On

Select * From [ConversionRules] (nolock) Where FromMachineId=@FromMachineId And ToMachineId=@ToMachineId

End