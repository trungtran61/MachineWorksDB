CREATE TABLE [dbo].[MWRFQ_Task] (
    [mwTaskName]   NVARCHAR (50)  NOT NULL,
    [mwTaskText]   NVARCHAR (50)  NULL,
    [mwDepartment] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_MWRFQ_Task] PRIMARY KEY CLUSTERED ([mwTaskName] ASC)
);

