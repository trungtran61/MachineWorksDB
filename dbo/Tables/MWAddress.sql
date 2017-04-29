CREATE TABLE [dbo].[MWAddress] (
    [mwHID]      INT            IDENTITY (1, 1) NOT NULL,
    [mwAddress1] NVARCHAR (100) NULL,
    [mwAddress2] NVARCHAR (100) NULL,
    [mwCity]     NVARCHAR (100) NULL,
    [mwState]    NVARCHAR (20)  NULL,
    [mwZip]      NVARCHAR (10)  NULL,
    [mwCountry]  NVARCHAR (50)  NULL,
    [mwPhone]    NVARCHAR (20)  NULL,
    [mwFax]      NVARCHAR (20)  NULL,
    [mwCell]     NVARCHAR (20)  NULL,
    [mwTollFree] NVARCHAR (20)  NULL,
    [mwEmail]    NVARCHAR (50)  NULL,
    [mwWebsite]  NVARCHAR (100) NULL,
    CONSTRAINT [PK_MWAddress] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

