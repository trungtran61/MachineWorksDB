CREATE TABLE [dbo].[MWCheckList_User] (
    [mwUserName]   NCHAR (20)     CONSTRAINT [DF_MWCheckList_User_mwUserName] DEFAULT ('') NOT NULL,
    [mwDepartment] NVARCHAR (200) CONSTRAINT [DF_MWCheckList_User_mwDepartment] DEFAULT ('') NULL,
    CONSTRAINT [PK_MWCheckList_User] PRIMARY KEY CLUSTERED ([mwUserName] ASC)
);

