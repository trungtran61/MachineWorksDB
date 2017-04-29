CREATE TABLE [dbo].[ToolSetup] (
    [ID]             INT            IDENTITY (1, 1) NOT NULL,
    [Sequence]       INT            NULL,
    [N]              INT            NULL,
    [ToolNumber]     INT            NULL,
    [TONumber]       INT            NULL,
    [CuttingMethod]  VARCHAR (50)   NULL,
    [SpecialComment] VARCHAR (50)   NULL,
    [PartsPerCorner] INT            NULL,
    [SecondsPerTool] INT            NULL,
    [Comment]        VARCHAR (MAX)  NULL,
    [Snippet]        NVARCHAR (MAX) NULL,
    [ToolID]         INT            NULL,
    [ToolHolder1ID]  INT            NULL,
    [ToolHolder2ID]  INT            NULL,
    [ToolHolder3ID]  INT            NULL,
    [ToolDesc]       NVARCHAR (200) NULL,
    [Created]        DATETIME       NULL,
    [CreatedBy]      VARCHAR (50)   NULL,
    [Modified]       DATETIME       NULL,
    [ModifiedBy]     VARCHAR (50)   NULL,
    CONSTRAINT [PK_ToolSetupSheet_ToolSetups] PRIMARY KEY CLUSTERED ([ID] ASC)
);

