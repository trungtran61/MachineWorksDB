CREATE TABLE [dbo].[ToolSetupSheet_ToolSetup] (
    [ToolSetupSheet_ID] INT NOT NULL,
    [ToolSetup_ID]      INT NOT NULL,
    CONSTRAINT [PK_ToolSetupSheet_ToolSetup_1] PRIMARY KEY CLUSTERED ([ToolSetupSheet_ID] ASC, [ToolSetup_ID] ASC)
);

