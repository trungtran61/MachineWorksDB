CREATE TABLE [dbo].[MWInventory] (
    [mwHID]            INT            IDENTITY (1, 1) NOT NULL,
    [mwItemID]         NVARCHAR (20)  NULL,
    [mwCategory]       NVARCHAR (50)  NULL,
    [mwItemName]       NVARCHAR (50)  NULL,
    [mwItemType]       NVARCHAR (50)  NULL,
    [mwLocation]       NVARCHAR (MAX) NULL,
    [mwQuantity]       INT            NULL,
    [mwSize]           NVARCHAR (50)  NULL,
    [mwDescription]    NVARCHAR (MAX) NULL,
    [mwManufacturer]   NVARCHAR (50)  NULL,
    [mwModel]          NVARCHAR (50)  NULL,
    [mwModelNumber]    NVARCHAR (50)  NULL,
    [mwSerialNumber]   NVARCHAR (50)  NULL,
    [mwDatePurchased]  DATETIME       NULL,
    [mwVendorID]       NVARCHAR (20)  NULL,
    [mwPurchasePrice]  MONEY          NULL,
    [mwAppraisedValue] MONEY          NULL,
    [mwInsured]        BIT            NULL,
    [mwNotes]          NTEXT          NULL,
    CONSTRAINT [PK_MWInventory] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

