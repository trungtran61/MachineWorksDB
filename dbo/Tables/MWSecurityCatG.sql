CREATE TABLE [dbo].[MWSecurityCatG] (
    [mwHID]   INT           IDENTITY (1, 1) NOT NULL,
    [mwGroup] NVARCHAR (50) NULL,
    [mwCatID] INT           NULL,
    [mwLevel] INT           NULL,
    CONSTRAINT [PK_MWSecurityCatG] PRIMARY KEY CLUSTERED ([mwHID] ASC),
    CONSTRAINT [FK_MWSecurityCatG_MWToolInventory_Category] FOREIGN KEY ([mwCatID]) REFERENCES [dbo].[MWToolInventory_Category] ([mwHID])
);

