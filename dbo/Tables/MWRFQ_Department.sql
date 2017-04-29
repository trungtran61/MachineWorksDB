CREATE TABLE [dbo].[MWRFQ_Department] (
    [mwQuote]      NVARCHAR (50) NULL,
    [mwDepartment] NVARCHAR (50) CONSTRAINT [DF_RFQ_Department_mwDepartment] DEFAULT ('') NULL,
    [mwTaskName]   NVARCHAR (50) CONSTRAINT [DF_RFQ_Department_mwTask] DEFAULT ('') NULL,
    [mwTaskText]   NVARCHAR (50) NULL,
    [mwStatus]     NCHAR (5)     CONSTRAINT [DF_RFQ_Department_mwStatus] DEFAULT (N'No') NULL
);

