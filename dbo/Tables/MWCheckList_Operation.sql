CREATE TABLE [dbo].[MWCheckList_Operation] (
    [mwWorkOrder]  NVARCHAR (50) NULL,
    [mwOP]         INT           CONSTRAINT [DF_MWCheckList_Operation_mwOP] DEFAULT ((0)) NULL,
    [mwMachine]    NVARCHAR (50) CONSTRAINT [DF_MWCheckList_Operation_mwMachine] DEFAULT ('') NULL,
    [mwLocation]   NVARCHAR (50) CONSTRAINT [DF_MWCheckList_Operation_mwLocation] DEFAULT ('') NULL,
    [mwGood]       INT           CONSTRAINT [DF_MWCheckList_Operation_mwGood] DEFAULT ((0)) NULL,
    [mwReworkable] INT           CONSTRAINT [DF_MWCheckList_Operation_mwReworkable] DEFAULT ((0)) NULL,
    [mwScrap]      INT           CONSTRAINT [DF_MWCheckList_Operation_mwScrap] DEFAULT ((0)) NULL,
    [mwTotal]      INT           CONSTRAINT [DF_MWCheckList_Operation_mwTotal] DEFAULT ((0)) NULL,
    [mwInitial]    NCHAR (5)     CONSTRAINT [DF_MWCheckList_Operation_mwInitial] DEFAULT ('') NULL,
    [mwDate]       DATETIME      CONSTRAINT [DF_MWCheckList_Operation_mwDate] DEFAULT (getdate()) NULL,
    [mwDueDate]    DATETIME      CONSTRAINT [DF_MWCheckList_Operation_mwDueDate] DEFAULT (getdate()) NULL,
    [mwStatus]     NCHAR (5)     CONSTRAINT [DF_MWCheckList_Operation_mwStatus] DEFAULT (N'No') NULL
);

