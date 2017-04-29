/****** Script for SelectTopNRows command from SSMS  ******/
CREATE Proc [dbo].[spSaveToolInventoryCodeColumns]
(
@Code			varchar(30)
,@Columns		varchar(max)
,@ModifiedBy	varchar(30)=null
)
As
Begin

Set NoCount On

Declare @tblColumns Table
	(
			ColumnName	varchar(30)
	)		

	If @Columns is not null
	Begin
		Insert @tblColumns
			Exec SplitStringIntoRows @sStrings=@Columns,@delimiter=';'
		Delete MWToolInventoryCodeColumn Where Code=@Code 
		Insert MWToolInventoryCodeColumn ([Code],[ColumnName],[ModifiedBy],[ModifiedOn])
			Select @Code, ColumnName, @ModifiedBy, GetDate() From @tblColumns
	End		

End