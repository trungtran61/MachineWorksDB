CREATE TABLE [dbo].[MWRFQ] (
    [mwHID]           INT           CONSTRAINT [DF_MWRFQ_mwHID] DEFAULT ((0)) NULL,
    [mwQuote]         NVARCHAR (50) NOT NULL,
    [mwPartNumber]    NVARCHAR (50) CONSTRAINT [DF_RFQ_mwPartNumber] DEFAULT ('') NULL,
    [mwRevision]      NCHAR (10)    CONSTRAINT [DF_RFQ_mwRevision] DEFAULT ('') NULL,
    [mwStartDate]     DATETIME      CONSTRAINT [DF_RFQ_mwStartDate] DEFAULT (getdate()) NULL,
    [mwDueDate]       DATETIME      CONSTRAINT [DF_RFQ_mwDueDate] DEFAULT (getdate()) NULL,
    [mwEngineerDate]  DATETIME      CONSTRAINT [DF_RFQ_mwEngineerDate] DEFAULT (getdate()) NULL,
    [mwQualityDate]   DATETIME      CONSTRAINT [DF_RFQ_mwQualityDate] DEFAULT (getdate()) NULL,
    [mwSaleDate]      DATETIME      CONSTRAINT [DF_RFQ_mwSaleDate] DEFAULT (getdate()) NULL,
    [mwCurDept]       NVARCHAR (50) CONSTRAINT [DF_RFQ_mwCurDept] DEFAULT (N'Engineer') NULL,
    [mwStatus]        NCHAR (5)     CONSTRAINT [DF_RFQ_mwStatus] DEFAULT (N'No') NULL,
    [mwQuantity]      INT           CONSTRAINT [DF_RFQ_mwQty1] DEFAULT ((0)) NULL,
    [mwQuotation]     NCHAR (100)   CONSTRAINT [DF_MWRFQ_mwQuotation] DEFAULT ('') NULL,
    [mwOPS]           INT           CONSTRAINT [DF_MWRFQ_mwOPS] DEFAULT ((0)) NULL,
    [mwSubPartNumber] NVARCHAR (50) CONSTRAINT [DF_MWRFQ_mwSubPartNumber] DEFAULT ('') NULL,
    [mwSubRevision]   NCHAR (10)    CONSTRAINT [DF_MWRFQ_mwSubRevision] DEFAULT ('') NULL,
    [mwSubQuantity]   INT           CONSTRAINT [DF_MWRFQ_mwSubQuantity] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_RFQ] PRIMARY KEY CLUSTERED ([mwQuote] ASC)
);

