CREATE TABLE [dbo].[ConversionRules] (
    [ID]            INT            IDENTITY (1, 1) NOT NULL,
    [FromMachineId] VARCHAR (20)   NULL,
    [ToMachineId]   VARCHAR (20)   NULL,
    [FromSnippet]   VARCHAR (1000) NULL,
    [ToSnippet]     VARCHAR (1000) NULL,
    [Created]       DATETIME       NULL,
    [CreatedBy]     VARCHAR (50)   NULL,
    [Modified]      DATETIME       NULL,
    [ModifiedBy]    VARCHAR (50)   NULL,
    CONSTRAINT [PK_ConversionRules] PRIMARY KEY CLUSTERED ([ID] ASC)
);

