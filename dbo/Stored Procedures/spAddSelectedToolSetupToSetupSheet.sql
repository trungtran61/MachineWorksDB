-- [spAddSelectedToolSetupToSetupSheet] '1|item,21|group,322|item','tienphan'
CREATE  Proc [dbo].[spAddSelectedToolSetupToSetupSheet]
(
@ToolSetupSheetID	int,
@ID_GroupTypes	varchar(200),
@UserName	varchar(20)
)
As
Begin

Set NoCount On

Declare @tblIds Table
(
	id int,
	grouptype varchar(10)
)
Insert @tblIds (id, grouptype)
	SELECT SUBSTRING(id,1,CharIndex('|',id,1)-1), SUBSTRING(id,CharIndex('|',id,1)+1,LEN(id))  FROM dbo.CSVToTable(@ID_GroupTypes)

Declare @id int,
	@grouptype varchar(10)

Declare crsId cursor
for
Select id, grouptype From @tblIds

Open crsId

Fetch Next From crsId Into @id, @grouptype

While @@FETCH_STATUS = 0
Begin
	If @grouptype = 'group'
	Begin		
		Insert Into [ToolSetupSheet_ToolSetup] ([ToolSetupSheet_ID], [ToolSetup_ID])
			Select @ToolSetupSheetID, tsg.[ToolSetupId] From [ToolSetupGroup] tsg
				Left Join [ToolSetupSheet_ToolSetup] tssts on tssts.ToolSetupSheet_ID=@ToolSetupSheetID and tssts.ToolSetup_ID=tsg.ToolSetupID
				Where [MainToolSetupId]=@id and tssts.ToolSetup_ID is null
	End
	Else
		If Not Exists (Select '*' From [ToolSetupSheet_ToolSetup] Where [ToolSetupSheet_ID]=@ToolSetupSheetID And [ToolSetup_ID]=@id) 
			Insert Into [ToolSetupSheet_ToolSetup] ([ToolSetupSheet_ID], [ToolSetup_ID])
				Select @ToolSetupSheetID, [Id] From [ToolSetup] where ID=@id
	
	Fetch Next From crsId Into @id, @grouptype	
End

Close crsId
Deallocate crsId

End 
   