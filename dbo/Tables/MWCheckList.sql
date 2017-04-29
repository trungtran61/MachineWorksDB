CREATE TABLE [dbo].[MWCheckList] (
    [mwHID]             INT            IDENTITY (1, 1) NOT NULL,
    [mwWorkOrder]       NVARCHAR (50)  CONSTRAINT [DF_MWCheckList_mwWorkOrder] DEFAULT ('') NOT NULL,
    [mwPartNumber]      NVARCHAR (50)  CONSTRAINT [DF_MWCheckList_MWPartNumber] DEFAULT ('') NULL,
    [mwRevision]        NCHAR (10)     CONSTRAINT [DF_MWCheckList_MWRevision] DEFAULT ('') NULL,
    [mwStartDate]       DATETIME       CONSTRAINT [DF_MWCheckList_mwStartDate] DEFAULT (getdate()) NULL,
    [mwDueDate]         DATETIME       CONSTRAINT [DF_MWCheckList_MWDueDate] DEFAULT (getdate()) NULL,
    [mwSaleDate]        DATETIME       CONSTRAINT [DF_MWCheckList_MWSaleDate] DEFAULT (getdate()) NULL,
    [mwEngineerDate]    DATETIME       CONSTRAINT [DF_MWCheckList_MWEngineerDate] DEFAULT (getdate()) NULL,
    [mwQualityDate]     DATETIME       CONSTRAINT [DF_MWCheckList_MWQualityDate] DEFAULT (getdate()) NULL,
    [mwManufactureDate] DATETIME       CONSTRAINT [DF_MWCheckList_mwManufactureDate] DEFAULT (getdate()) NULL,
    [mwShippingDate]    DATETIME       CONSTRAINT [DF_MWCheckList_mwShippingDate] DEFAULT (getdate()) NULL,
    [mwDeliveryDate]    DATETIME       CONSTRAINT [DF_MWCheckList_mwDeliveryDate] DEFAULT (getdate()) NULL,
    [mwQty]             INT            CONSTRAINT [DF_MWCheckList_mwQty] DEFAULT ((0)) NULL,
    [mwCurQty]          INT            CONSTRAINT [DF_MWCheckList_mwCurQty] DEFAULT ((0)) NULL,
    [mwShipQty]         INT            CONSTRAINT [DF_MWCheckList_mwShipQty] DEFAULT ((0)) NULL,
    [mwOP]              INT            CONSTRAINT [DF_MWCheckList_mwOP] DEFAULT ((0)) NULL,
    [mwHotJob]          NCHAR (5)      CONSTRAINT [DF_MWCheckList_mwHotJob] DEFAULT (N'No') NULL,
    [mwStatus]          NCHAR (10)     CONSTRAINT [DF_MWCheckList_mwStatus] DEFAULT (N'No') NULL,
    [mwCurDept]         NVARCHAR (50)  CONSTRAINT [DF_MWCheckList_mwCurDept] DEFAULT ('Sale') NULL,
    [mwCurOp]           INT            CONSTRAINT [DF_MWCheckList_mwCurOp] DEFAULT ((10)) NULL,
    [mwCustomerPO]      NVARCHAR (20)  CONSTRAINT [DF_MWCheckList_mwCustomerPO] DEFAULT ('') NULL,
    [mwCustomerID]      INT            NULL,
    [mwUseWO]           NVARCHAR (50)  CONSTRAINT [DF_MWCheckList_mwUseWO] DEFAULT ('') NULL,
    [mwEngineer]        NVARCHAR (50)  CONSTRAINT [DF_MWCheckList_mwEngineer] DEFAULT ('') NULL,
    [mwUnitPrice]       MONEY          NULL,
    [mwComment]         NVARCHAR (255) CONSTRAINT [DF_MWCheckList_mwComment] DEFAULT ('') NULL,
    [mwIsCmp]           BIT            CONSTRAINT [DF_MWCheckList_mwIsCmp] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_MWCheckList_1] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MWCheckList]
    ON [dbo].[MWCheckList]([mwWorkOrder] ASC);

