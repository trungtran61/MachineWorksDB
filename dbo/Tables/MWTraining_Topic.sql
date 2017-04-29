CREATE TABLE [dbo].[MWTraining_Topic] (
    [mwHID]   INT            IDENTITY (1, 1) NOT NULL,
    [mwTopic] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_MWTraining_Topic] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

