
CREATE view [dbo].[vwUOM]
as
SELECT ID=HID,Name=mValue,Description=mText, SortOrder 
	FROM proWIP.dbo.DropdownList 
	WHERE Category='Unit' 





