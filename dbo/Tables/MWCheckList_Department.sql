CREATE TABLE [dbo].[MWCheckList_Department] (
    [mwWorkOrder]  NVARCHAR (50) NULL,
    [mwDepartment] NVARCHAR (50) CONSTRAINT [DF_MWCheckList_Department_mwDepartment] DEFAULT ('') NULL,
    [mwTask]       NVARCHAR (50) CONSTRAINT [DF_MWCheckList_Department_mwTask] DEFAULT ('') NULL,
    [mwStatus]     NCHAR (5)     CONSTRAINT [DF_MWCheckList_Department_mwStatus] DEFAULT (N'No') NULL,
    [mwCurOp]      INT           CONSTRAINT [DF_MWCheckList_Department_mwCurOp] DEFAULT ((10)) NULL
);

