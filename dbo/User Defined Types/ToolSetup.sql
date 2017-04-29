CREATE TYPE [dbo].[ToolSetup] AS TABLE (
    [Sequence]        INT            NULL,
    [N]               INT            NULL,
    [ToolNumber]      INT            NULL,
    [TONumber]        INT            NULL,
    [CuttingMethodId] INT            NULL,
    [Program]         NVARCHAR (MAX) NULL,
    [ToolDesc]        NVARCHAR (200) NULL,
    [ToolHolderItem1] NVARCHAR (50)  NULL,
    [ToolHolderItem2] NVARCHAR (50)  NULL,
    [ToolHolderItem3] NVARCHAR (50)  NULL,
    [ToolHolderMWID1] NVARCHAR (50)  NULL,
    [ToolHolderMWID2] NVARCHAR (50)  NULL,
    [ToolHolderMWID3] NVARCHAR (50)  NULL,
    [ToolHolderLoc1]  NVARCHAR (50)  NULL,
    [ToolHolderLoc2]  NVARCHAR (50)  NULL,
    [ToolHolderLoc3]  NVARCHAR (50)  NULL);

