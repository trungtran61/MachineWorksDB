CREATE TABLE [dbo].[MWCheckList_Note] (
    [mwHID]       INT             IDENTITY (1, 1) NOT NULL,
    [mwWorkOrder] NVARCHAR (50)   NULL,
    [mwNote]      NVARCHAR (4000) NULL,
    CONSTRAINT [PK_MWCheckList_Note] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MWCheckList_Note]
    ON [dbo].[MWCheckList_Note]([mwWorkOrder] ASC);

