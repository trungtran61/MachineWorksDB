CREATE TABLE [dbo].[MWCheckList_CompletedDate] (
    [mwWorkOrder]       NVARCHAR (50) NOT NULL,
    [mwSaleDate]        DATETIME      CONSTRAINT [DF_MWCheckList_CompletedDate_mwSaleDate] DEFAULT (getdate()) NULL,
    [mwEngineerDate]    DATETIME      CONSTRAINT [DF_MWCheckList_CompletedDate_mwEngineerDate] DEFAULT (getdate()) NULL,
    [mwQualityDate]     DATETIME      CONSTRAINT [DF_MWCheckList_CompletedDate_mwQualityDate] DEFAULT (getdate()) NULL,
    [mwManufactureDate] DATETIME      CONSTRAINT [DF_MWCheckList_CompletedDate_mwManufactureDate] DEFAULT (getdate()) NULL,
    [mwShippingDate]    DATETIME      CONSTRAINT [DF_MWCheckList_CompletedDate_mwShippingDate] DEFAULT (getdate()) NULL,
    [mwDeliveryDate]    DATETIME      CONSTRAINT [DF_MWCheckList_CompletedDate_mwDeliveryDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_MWCheckList_CompletedDate] PRIMARY KEY CLUSTERED ([mwWorkOrder] ASC)
);

