CREATE TABLE [dbo].[MWMaterials] (
    [mwHID]      INT            IDENTITY (1, 1) NOT NULL,
    [mwType]     NVARCHAR (50)  NULL,
    [mwSize]     NVARCHAR (50)  NULL,
    [mwQty]      INT            NULL,
    [mwUnit]     NVARCHAR (50)  NULL,
    [mwLocation] NVARCHAR (255) NULL,
    CONSTRAINT [PK_MWMaterials] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

