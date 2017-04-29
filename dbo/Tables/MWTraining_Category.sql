CREATE TABLE [dbo].[MWTraining_Category] (
    [mwHID]      INT            IDENTITY (1, 1) NOT NULL,
    [mwKey]      NVARCHAR (100) NULL,
    [mwCategory] NVARCHAR (100) NULL,
    CONSTRAINT [PK_MWTraining_Category] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MWTraining_Category]
    ON [dbo].[MWTraining_Category]([mwKey] ASC);

