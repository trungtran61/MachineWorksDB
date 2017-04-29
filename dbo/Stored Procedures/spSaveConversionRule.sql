-- spSaveConversionRule ''
Create Proc [dbo].spSaveConversionRule
(
@RuleId			int=0
,@FromMachineId	varchar(20)
,@ToMachineId	varchar(20)
,@FromSnippet	varchar(1000)
,@ToSnippet	varchar(1000)
,@UserName	varchar(50)
)
As
Begin

If @RuleId = 0
	Insert [dbo].[ConversionRules]
		(FromMachineId,ToMachineId,FromSnippet,ToSnippet,Created,CreatedBy)
	Values (@FromMachineId,@ToMachineId,@FromSnippet,@ToSnippet,GetDate(),@UserName)
Else
	Update [dbo].[ConversionRules]
		Set FromSnippet=@FromSnippet, ToSnippet=@ToSnippet, [Modified]=getdate(), ModifiedBy=@UserName
		Where ID=@RuleId	 
End

  