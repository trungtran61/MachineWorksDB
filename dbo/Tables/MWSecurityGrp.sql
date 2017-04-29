CREATE TABLE [dbo].[MWSecurityGrp] (
    [mwHID]   INT           IDENTITY (1, 1) NOT NULL,
    [mwGroup] NVARCHAR (50) NULL,
    [mwApp]   NVARCHAR (50) NULL,
    [mwLevel] TINYINT       CONSTRAINT [DF_MWSecurityGrp_mwLevel] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_MWSecurityGrp] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

