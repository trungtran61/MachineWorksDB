CREATE TABLE [dbo].[MWUser] (
    [mwUserName]       NVARCHAR (50)   NOT NULL,
    [mwPassword]       NVARCHAR (20)   NULL,
    [mwEmployeeID]     NVARCHAR (30)   NULL,
    [mwName]           NVARCHAR (100)  NULL,
    [mwEmail]          VARCHAR (100)   NULL,
    [mwMember]         NVARCHAR (255)  CONSTRAINT [DF_MWUser_mwMember] DEFAULT (N'Crew') NULL,
    [mwDepartment]     NVARCHAR (2000) CONSTRAINT [DF_MWUser_mwDepartment] DEFAULT (N':') NULL,
    [mwTempFile]       NVARCHAR (255)  CONSTRAINT [DF_MWUser_mwTempFile] DEFAULT (N':') NULL,
    [mwStatus]         BIT             CONSTRAINT [DF_MWUser_mwStatus] DEFAULT ((1)) NULL,
    [mwActive]         BIT             CONSTRAINT [DF_MWUser_mwActive] DEFAULT ((1)) NULL,
    [mwPasswordDate]   DATETIME        CONSTRAINT [DF_MWUser_mwPasswordDate] DEFAULT (getdate()) NULL,
    [mwPasswordExpire] INT             CONSTRAINT [DF_MWUser_mwPasswordExpire] DEFAULT ((30)) NULL,
    [mwSessionExpire]  INT             CONSTRAINT [DF_MWUser_mwSessionExpire] DEFAULT ((30)) NULL,
    [mwTitle]          VARCHAR (50)    NULL,
    CONSTRAINT [PK_MWUser] PRIMARY KEY CLUSTERED ([mwUserName] ASC)
);

