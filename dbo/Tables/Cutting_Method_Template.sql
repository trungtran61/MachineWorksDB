CREATE TABLE [dbo].[Cutting_Method_Template] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [CuttingMethod] VARCHAR (50)  NOT NULL,
    [Template]      VARCHAR (MAX) NULL,
    CONSTRAINT [PK_Cutting_Method_Template_New] PRIMARY KEY CLUSTERED ([Id] ASC)
);

