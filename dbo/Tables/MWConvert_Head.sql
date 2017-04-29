CREATE TABLE [dbo].[MWConvert_Head] (
    [mwHID]  INT           IDENTITY (1, 1) NOT NULL,
    [mwName] NVARCHAR (50) NULL,
    CONSTRAINT [PK_MWConvert_Head] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MWConvert_Head]
    ON [dbo].[MWConvert_Head]([mwName] ASC);

