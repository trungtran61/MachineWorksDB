CREATE TABLE [dbo].[MWTraining_Title] (
    [mwTitle] NCHAR (50)     CONSTRAINT [DF_MWTraining_Title_mwTitle] DEFAULT ('') NULL,
    [mwTopic] NVARCHAR (MAX) CONSTRAINT [DF_MWTraining_Title_mwTopic] DEFAULT ('') NULL,
    [mwOpt]   NCHAR (1)      CONSTRAINT [DF_MWTraining_Title_mwOpt] DEFAULT (N'R') NULL
);

