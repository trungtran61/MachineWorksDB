-- spGetSetupSheets '00001-ITEM1'
CREATE proc [dbo].[spGetSetupSheets]
(
@partnumber varchar(100)=null
,@revision  varchar(20)=null
,@operation  varchar(10)=null
)
As
Begin
Set NoCount On

SELECT --pn.PartName, pn.PartNumber, 
tss.PartNumber, tss.Revision, tss.Operation, tss.ID FROM [ToolSetupSheet] tss
--INNER JOIN proWIP.dbo.[PartNumber] pn On pn.HID=tss.PartNumberID
 where (tss.PartNumber = @partnumber or @partnumber is null) and
 (tss.Revision = @revision or @revision is null) and
 (tss.Operation = @operation or @operation is null)

End