 CREATE Proc [dbo].[spInsertLookupValue] 
 (
		@Category varchar(50), 
		@Value varchar(50), 
		@Text varchar(50)=null,
	    @Active bit=1
)
As
Begin
  IF LTrim(@Value) <> ''	
	Begin
		If @Text is null
			Set @Text = @Value
	
		IF NOT EXISTS (SELECT '*'	FROM proWIP.dbo.DropdownList 
			WHERE Category=@Category And (mText=@Text Or mValue=@Value))	
			Insert proWIP.dbo.DropdownList (mText,mValue,isActive,Category,SortOrder)
				Select @Text,@Value,1,@Category,
				(Select IsNull(MAX(SortOrder)+10,10) From proWIP.dbo.DropdownList 
					WHERE Category=@Category)
	End
End