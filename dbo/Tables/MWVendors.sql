CREATE TABLE [dbo].[MWVendors] (
    [mwHID]        INT            IDENTITY (1, 1) NOT NULL,
    [mwVendorName] NVARCHAR (100) NULL,
    [mwVendorType] NVARCHAR (50)  NULL,
    [mwAddressID]  INT            NULL,
    CONSTRAINT [PK_MWVendors] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

