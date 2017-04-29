CREATE view vwToolsInventory
as

Select ti.*, CategoryName=pt.Name From MWToolInventory ti (nolock)
	Left Join vwProcessType pt (nolock)
		On ti.mwCategoryID=pt.HID