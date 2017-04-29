CREATE TABLE [dbo].[MWCheckList_PartialShip] (
    [mwHID]       INT           IDENTITY (1, 1) NOT NULL,
    [mwWorkOrder] NVARCHAR (50) NULL,
    [mwQty]       INT           NULL,
    [mwDate]      DATETIME      CONSTRAINT [DF_MWCheckList_PartialShip_mwDate] DEFAULT (getdate()) NULL,
    [isDelivered] BIT           CONSTRAINT [DF_MWCheckList_PartialShip_isDelivered] DEFAULT ((0)) NULL,
    [isBilled]    BIT           CONSTRAINT [DF_MWCheckList_PartialShip_isBilled] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_MWCheckList_PartialShip] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

