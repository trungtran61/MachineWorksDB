CREATE TABLE [dbo].[MWCheckList_Comment] (
    [mwWorkOrder]  NVARCHAR (50)  NULL,
    [mwComment]    NVARCHAR (MAX) CONSTRAINT [DF_MWCheckList_Comment_MWComment] DEFAULT ('') NULL,
    [mwUserName]   NCHAR (20)     NULL,
    [mwDepartment] NVARCHAR (200) CONSTRAINT [DF_MWCheckList_Comment_MWFrom] DEFAULT ('') NULL,
    [mwTo]         NVARCHAR (50)  CONSTRAINT [DF_MWCheckList_Comment_MWTo] DEFAULT (N'All') NULL,
    [mwDate]       DATETIME       CONSTRAINT [DF_MWCheckList_Comment_MWDate] DEFAULT (getdate()) NULL
);

