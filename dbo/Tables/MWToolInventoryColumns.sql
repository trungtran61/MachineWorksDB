CREATE TABLE [dbo].[MWToolInventoryColumns] (
    [ColumnName]        VARCHAR (30) NULL,
    [ColumnHeader]      VARCHAR (30) NULL,
    [PropertyName]      VARCHAR (30) NULL,
    [Searchable]        BIT          CONSTRAINT [DF_MWToolInventoryColumns_Searchable] DEFAULT ((0)) NULL,
    [Sequence]          INT          NULL,
    [RelatedTable]      VARCHAR (50) NULL,
    [RelatedIDField]    VARCHAR (50) NULL,
    [RelatedTextField]  VARCHAR (50) NULL,
    [InputType]         VARCHAR (50) NULL,
    [SelectedByDefault] BIT          NULL,
    [UISize]            TINYINT      CONSTRAINT [DF_MWToolInventoryColumns_UISize] DEFAULT ((1)) NULL
);

