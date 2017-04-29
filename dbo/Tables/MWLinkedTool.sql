CREATE TABLE [dbo].[MWLinkedTool] (
    [mwHID]      INT           IDENTITY (1, 1) NOT NULL,
    [mwLinkCode] NVARCHAR (20) CONSTRAINT [DF_MWLinkedTool_mwLinkCode] DEFAULT ('') NULL,
    [mwParentID] INT           CONSTRAINT [DF_Table_1_mwBox] DEFAULT ((0)) NOT NULL,
    [mwChildID]  INT           CONSTRAINT [DF_Table_1_mwToolID] DEFAULT ((0)) NOT NULL,
    [mwQty]      INT           CONSTRAINT [DF_MWLinkedTool_mwQty] DEFAULT ((1)) NULL,
    CONSTRAINT [PK_MWLinkedTool] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

