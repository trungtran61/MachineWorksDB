CREATE TABLE [dbo].[MWSecurityApp] (
    [mwHID]   INT           IDENTITY (1, 1) NOT NULL,
    [mwApp]   NVARCHAR (50) NULL,
    [mwPage]  NVARCHAR (50) NULL,
    [mwKey]   NVARCHAR (50) NULL,
    [mwValue] NVARCHAR (50) NULL,
    [mwLevel] TINYINT       CONSTRAINT [DF_MWSecurityApp_mwLevel] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_MWSecurityApp] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

