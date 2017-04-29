CREATE TABLE [dbo].[MWSecurityCatA] (
    [mwHID]   INT           IDENTITY (1, 1) NOT NULL,
    [mwCatID] INT           NULL,
    [mwKey]   NVARCHAR (10) NULL,
    [mwValue] NVARCHAR (50) NULL,
    [mwLevel] INT           NULL,
    CONSTRAINT [PK_MWSecurityCatA] PRIMARY KEY CLUSTERED ([mwHID] ASC),
    CONSTRAINT [FK_MWSecurityCatA_MWToolInventory_Category] FOREIGN KEY ([mwCatID]) REFERENCES [dbo].[MWToolInventory_Category] ([mwHID])
);

