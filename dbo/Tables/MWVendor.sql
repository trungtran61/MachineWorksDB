CREATE TABLE [dbo].[MWVendor] (
    [mwHID]      INT            IDENTITY (1, 1) NOT NULL,
    [mwVendorID] NVARCHAR (20)  NULL,
    [mwName]     NVARCHAR (50)  NULL,
    [mwAddress]  NVARCHAR (255) NULL,
    [mwCity]     NVARCHAR (50)  NULL,
    [mwState]    NVARCHAR (50)  NULL,
    [mwZip]      NVARCHAR (50)  NULL,
    [mwPhone]    NVARCHAR (50)  NULL,
    [mwFax]      NVARCHAR (50)  NULL,
    [mwTollFree] NVARCHAR (50)  NULL,
    [mwEmail]    NVARCHAR (150) NULL,
    [mwWebSite]  NVARCHAR (150) NULL,
    CONSTRAINT [PK_MWVendor] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MWVendor]
    ON [dbo].[MWVendor]([mwVendorID] ASC);

