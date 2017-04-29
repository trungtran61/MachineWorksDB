CREATE TABLE [dbo].[ToolSetupGroup] (
    [ID]              INT          IDENTITY (1, 1) NOT NULL,
    [MainToolSetupId] INT          NULL,
    [ToolSetupId]     INT          NULL,
    [Sequence]        INT          NULL,
    [Created]         DATETIME     NULL,
    [CreatedBy]       VARCHAR (50) NULL,
    [Modified]        DATETIME     NULL,
    [ModifiedBy]      VARCHAR (50) NULL,
    CONSTRAINT [PK_ToolSetupGroup] PRIMARY KEY CLUSTERED ([ID] ASC)
);

