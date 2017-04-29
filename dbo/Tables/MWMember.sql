CREATE TABLE [dbo].[MWMember] (
    [mwMember] NVARCHAR (50) NULL,
    [mwAccess] NVARCHAR (50) NULL,
    [mwRead]   TINYINT       CONSTRAINT [DF_MWMember_mwRead] DEFAULT ((1)) NULL,
    [mwWrite]  TINYINT       CONSTRAINT [DF_MWMember_mwWrite] DEFAULT ((0)) NULL,
    [mwEdit]   TINYINT       CONSTRAINT [DF_MWMember_mwEdit] DEFAULT ((0)) NULL,
    [mwTool]   TINYINT       CONSTRAINT [DF_MWMember_mwTool] DEFAULT ((0)) NULL
);

