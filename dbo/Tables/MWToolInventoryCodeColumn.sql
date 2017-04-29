CREATE TABLE [dbo].[MWToolInventoryCodeColumn] (
    [Code]       VARCHAR (30) NOT NULL,
    [ColumnName] VARCHAR (30) NOT NULL,
    [ModifiedBy] VARCHAR (20) NULL,
    [ModifiedOn] DATETIME     NULL,
    CONSTRAINT [PK_MWToolInventoryCodeColumn] PRIMARY KEY CLUSTERED ([Code] ASC, [ColumnName] ASC)
);

