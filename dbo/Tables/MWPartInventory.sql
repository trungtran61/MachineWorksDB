CREATE TABLE [dbo].[MWPartInventory] (
    [mwHID]          INT            IDENTITY (1, 1) NOT NULL,
    [mwPartNumber]   NVARCHAR (50)  CONSTRAINT [DF_MWPartInventory_mwPartNumber] DEFAULT ('') NULL,
    [mwRevision]     NVARCHAR (20)  CONSTRAINT [DF_MWPartInventory_mwRevision] DEFAULT ('') NULL,
    [mwWorkOrder]    NVARCHAR (50)  CONSTRAINT [DF_MWPartInventory_mwWorkOrder] DEFAULT ('') NULL,
    [mwCustomerName] NVARCHAR (255) CONSTRAINT [DF_MWPartInventory_mwCustomerName] DEFAULT ('') NULL,
    [mwLocation]     NVARCHAR (255) CONSTRAINT [DF_MWPartInventory_mwLocation] DEFAULT ('') NULL,
    [mwStatus]       NVARCHAR (20)  CONSTRAINT [DF_MWPartInventory_mwStatus] DEFAULT ('') NULL,
    [mwQty]          INT            CONSTRAINT [DF_MWPartInventory_mwQty] DEFAULT ((0)) NULL,
    [mwQtyx]         INT            CONSTRAINT [DF_MWPartInventory_mwQtyx] DEFAULT ((0)) NULL,
    [mwOrderPoint]   INT            CONSTRAINT [DF_MWPartInventory_mwOrderPoint] DEFAULT ((-1)) NULL,
    [mwInvLevel]     INT            CONSTRAINT [DF_MWPartInventory_mwInvLevel] DEFAULT ((0)) NULL,
    [mwComment]      NVARCHAR (255) CONSTRAINT [DF_MWPartInventory_mwComment] DEFAULT ('') NULL,
    [mwDate]         DATETIME       CONSTRAINT [DF_MWPartInventory_mwDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_MWPartInventory] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

