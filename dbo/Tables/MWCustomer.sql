CREATE TABLE [dbo].[MWCustomer] (
    [mwHID]               INT            IDENTITY (1, 1) NOT NULL,
    [mwCustomerName]      NVARCHAR (100) NULL,
    [mwAddressID]         INT            NULL,
    [mwShippingAddressID] INT            CONSTRAINT [DF_MWCustomer_mwShippingAddressID] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_MWCustomer] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

