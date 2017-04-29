CREATE TABLE [dbo].[MWRFQ_User] (
    [mwUserName]   NCHAR (10)    NOT NULL,
    [mwDepartment] NVARCHAR (50) CONSTRAINT [DF_RFQ_User_mwDepartment] DEFAULT ('') NULL,
    CONSTRAINT [PK_RFQ_User] PRIMARY KEY CLUSTERED ([mwUserName] ASC)
);

