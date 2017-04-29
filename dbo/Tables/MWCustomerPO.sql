CREATE TABLE [dbo].[MWCustomerPO] (
    [mwHID]        INT             IDENTITY (1, 1) NOT NULL,
    [mwCustomerPO] NVARCHAR (50)   CONSTRAINT [DF_MWCustomerPO_mwCustomerPO] DEFAULT ('') NULL,
    [mwComment]    NVARCHAR (1000) CONSTRAINT [DF_MWCustomerPO_mwComment] DEFAULT ('') NULL,
    CONSTRAINT [PK_MWCustomerPO] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

