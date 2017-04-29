-- CheckOutCheckIn 'out','12345:1,333:2,4444:4'
-- exec CheckOutCheckIn @Action='checkout',@ModifiedBy='TienPhan',@Items_Qtys='12920:1'

CREATE proc [dbo].[CheckOutCheckIn]
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

Declare @multiplier int
Set @multiplier = 1
If @Action = 'CheckOut'
	Set @multiplier = -1	

Insert @tblItemsQtys (ItemQty)
	Exec [dbo].[SplitStringIntoRows] @Items_Qtys, ','

Update @tblItemsQtys Set ID=ti.mwHID,
	Qty= SUBSTRING(iq.ItemQty, CharIndex(':', iq.ItemQty)+1, LEN(iq.ItemQty) - CharIndex(':', iq.ItemQty)+1) * @multiplier,
	OnHand = ti.mwQty		
From @tblItemsQtys iq
	Inner Join [MWToolInventory] ti (nolock)
		On Left(iq.ItemQty, CharIndex(':', iq.ItemQty)-1)=ti.mwHID	

Update [MWToolInventory] 
		Set mwQtyX = mwQtyX - iq.Qty, mwQty = mwQty + iq.Qty		
	From [MWToolInventory] ti (nolock)
		Inner Join @tblItemsQtys iq
		On iq.ID=ti.mwHID	

INSERT INTO proMOGT.dbo.ToolTracking (ToolID,ActType,QtyBefore,QtyAfter,QtyNet,ActBy,ActDate)
		Select ID, @Action, OnHand, OnHand + Qty, Qty, @ModifiedBy, GetDate()  
		  From @tblItemsQtys 
		
		
End

--select * from proMOGT.dbo.ToolTracking  order by ActDate desc