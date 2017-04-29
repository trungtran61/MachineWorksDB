

CREATE view [dbo].[vwStickOutFromJawMinimum]
as
SELECT ID=HID,Name=mValue,Description=mText, SortOrder 
	FROM proWIP.dbo.DropdownList 
	WHERE Category='StickOutFromJawMinimum' 

