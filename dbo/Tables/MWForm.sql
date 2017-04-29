CREATE TABLE [dbo].[MWForm] (
    [mwHID]         INT            IDENTITY (1, 1) NOT NULL,
    [mwFormID]      NVARCHAR (7)   NULL,
    [mwName]        NVARCHAR (255) NULL,
    [mwDocType]     NVARCHAR (50)  CONSTRAINT [DF_MWForm_mwDocType] DEFAULT (N'Document') NULL,
    [mwPath]        NVARCHAR (255) CONSTRAINT [DF_MWForm_mwPath] DEFAULT (N'\\Mwmainserver\MWLibrary\MWForm') NULL,
    [mwFileName]    NVARCHAR (255) NULL,
    [mwDescription] NVARCHAR (255) NULL,
    [mwRevision]    NVARCHAR (50)  CONSTRAINT [DF_MWForm_mwRevision] DEFAULT (N'A') NULL,
    [mwDate]        DATETIME       CONSTRAINT [DF_MWForm_mwDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_MWForm] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MWForm]
    ON [dbo].[MWForm]([mwFormID] ASC);

