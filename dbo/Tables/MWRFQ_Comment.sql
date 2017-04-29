CREATE TABLE [dbo].[MWRFQ_Comment] (
    [mwQuote]      NVARCHAR (50)  NULL,
    [mwComment]    NVARCHAR (MAX) NULL,
    [mwUserName]   NCHAR (20)     NULL,
    [mwDepartment] NVARCHAR (50)  CONSTRAINT [DF_RFQ_Comment_mwDepartment] DEFAULT ('') NULL,
    [mwTo]         NVARCHAR (50)  CONSTRAINT [DF_RFQ_Comment_mwTo] DEFAULT (N'All') NULL,
    [mwDate]       DATETIME       CONSTRAINT [DF_RFQ_Comment_mwDate] DEFAULT (getdate()) NULL
);

