/****** Script for SelectTopNRows command from SSMS  ******/
CREATE Proc [dbo].[spCopyToolInventoryCodeColumns]
(
@Code			varchar(30)
,@CopyToCode	varchar(30)
,@ModifiedBy	varchar(30)=null
)
As
Begin

Set NoCount On

If Exists(Select '*' from MWToolInventoryCodeColumn Where Code=@CopyToCode)
	Delete MWToolInventoryCodeColumn Where Code=@CopyToCode 

Insert MWToolInventoryCodeColumn (Code, ColumnName, ModifiedBy, ModifiedOn)
	Select @CopyToCode, ColumnName, @ModifiedBy, GetDate() From  MWToolInventoryCodeColumn Where Code=@Code 	

End