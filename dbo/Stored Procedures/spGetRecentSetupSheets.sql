
-- [spGetRecentSetupSheets]
CREATE proc [dbo].[spGetRecentSetupSheets]
(
@number int=10
)
As
Begin
Set NoCount On

SELECT TOP (@number) 
--pn.PartName, pn.PartNumber, 
tss.PartNumber, tss.Revision, tss.Operation, tss.ID FROM [ToolSetupSheet] tss
--left JOIN proWIP.dbo.[PartNumber] pn On pn.HID=tss.PartNumberID
Where PartNumber is not null
 Order By ID Desc
End

