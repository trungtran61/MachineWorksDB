

-- exec DisposeReStock @Action='Dispose',@ModifiedBy='TienPhan',@Items_Qtys='12920:1'

CREATE proc [dbo].DisposeReStock
(
@Action	VarChar(10),
@ModifiedBy	varchar(30),
@Items_Qtys	varchar(max)
)
As
Begin

Set NoCount On

Declare @tblItemsQtys table
(
ItemQty		varchar(20),
ID			int,
Qty			int,
OnHand		int
)

Insert @tblItemsQtys (ItemQty)
	Exec [dbo].[SplitStringIntoRows] @Items_Qtys, ','

Update @tblItemsQtys Set ID=ti.mwHID,
	Qty= SUBSTRING(iq.ItemQty, CharIndex(':', iq.ItemQty)+1, LEN(iq.ItemQty) - CharIndex(':', iq.ItemQty)+1),
	OnHand = ti.mwQty		
From @tblItemsQtys iq
	Inner Join [MWToolInventory] ti (nolock)
		On Left(iq.ItemQty, CharIndex(':', iq.ItemQty)-1)=ti.mwHID	

If @Action = 'Dispose'
	Update [MWToolInventory] 
		Set mwQty = mwQty - iq.Qty, mwQtyX = mwQtyX + iq.Qty
		From [MWToolInventory] ti (nolock)
			Inner Join @tblItemsQtys iq
			On iq.ID=ti.mwHID	
Else
	Update [MWToolInventory] 
		Set mwQty = mwQty + iq.Qty
		From [MWToolInventory] ti (nolock)
			Inner Join @tblItemsQtys iq
			On iq.ID=ti.mwHID

INSERT INTO proMOGT.dbo.ToolTracking (ToolID,ActType,QtyBefore,QtyAfter,QtyNet,ActBy,ActDate)
		Select ID, @Action, OnHand, OnHand + Qty, Qty, @ModifiedBy, GetDate()  
		  From @tblItemsQtys 
		
		
End

--select * from proMOGT.dbo.ToolTracking  order by ActDate desc
