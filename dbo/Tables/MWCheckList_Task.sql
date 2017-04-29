CREATE TABLE [dbo].[MWCheckList_Task] (
    [mwDepartment] NVARCHAR (50) CONSTRAINT [DF_MWCheckList_Task_mwDepartment] DEFAULT ('') NULL,
    [mwTask]       NVARCHAR (50) CONSTRAINT [DF_MWCheckList_Task_mwTask] DEFAULT ('') NULL
);

