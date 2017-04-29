CREATE TABLE [dbo].[ToolSetupSheet_Program] (
    [ID]                 INT            IDENTITY (1, 1) NOT NULL,
    [[ToolSetupSheet_ID] INT            NULL,
    [Proven]             BIT            NULL,
    [Program]            NVARCHAR (MAX) NULL,
    [Created]            DATETIME       NULL,
    [CreatedBy]          VARCHAR (20)   NULL,
    [Modified]           DATETIME       NULL,
    [ModifiedBy]         VARCHAR (20)   NULL
);

