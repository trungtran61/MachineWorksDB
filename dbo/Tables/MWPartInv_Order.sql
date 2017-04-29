CREATE TABLE [dbo].[MWPartInv_Order] (
    [mwHID]          INT            IDENTITY (1, 1) NOT NULL,
    [mwPartID]       INT            CONSTRAINT [DF_MWPartInv_Order_mwPartID] DEFAULT ((0)) NULL,
    [mwWorkOrder]    NVARCHAR (50)  CONSTRAINT [DF_MWPartInv_Order_mwWorkOrder] DEFAULT ('') NULL,
    [mwCustomerName] NVARCHAR (100) CONSTRAINT [DF_MWPartInv_Order_mwCustomerName] DEFAULT ('') NULL,
    [mwLocation]     NVARCHAR (100) CONSTRAINT [DF_MWPartInv_Order_mwLocation] DEFAULT ('') NULL,
    [mwStatus]       NVARCHAR (20)  CONSTRAINT [DF_MWPartInv_Order_mwStatus] DEFAULT ('') NULL,
    [mwQty]          INT            CONSTRAINT [DF_MWPartInv_Order_mwQty] DEFAULT ((0)) NULL,
    [mwQtyx]         INT            CONSTRAINT [DF_MWPartInv_Order_mwQtyx] DEFAULT ((0)) NULL,
    [mwComment]      NVARCHAR (255) CONSTRAINT [DF_MWPartInv_Order_mwComment] DEFAULT ('') NULL,
    [mwDate]         DATETIME       CONSTRAINT [DF_MWPartInv_Order_mwDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_MWPartInv_Order] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

