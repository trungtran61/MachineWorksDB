CREATE TABLE [dbo].[MWToolInventory_Status] (
    [mwHID]    INT           IDENTITY (1, 1) NOT NULL,
    [mwStatus] NVARCHAR (50) CONSTRAINT [DF_MWToolInventory_Status_mwStatus] DEFAULT (N'New') NULL,
    CONSTRAINT [PK_MWToolInventory_Status] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

