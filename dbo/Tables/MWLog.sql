CREATE TABLE [dbo].[MWLog] (
    [mwHID]         INT            IDENTITY (1, 1) NOT NULL,
    [mwUserName]    NVARCHAR (50)  NULL,
    [mwName]        NVARCHAR (100) NULL,
    [mwMachineName] NVARCHAR (100) NULL,
    [mwAction]      NVARCHAR (255) NULL,
    [mwDate]        DATETIME       NULL,
    CONSTRAINT [PK_MWLog] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

