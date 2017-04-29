-- spGetConversionRules 'D01','D02'
Create Proc spDeleteConversionRule
(
@Id	int
)
As
Begin

Set NoCount On

Delete From [ConversionRules] Where ID=@Id

End