CREATE TABLE [dbo].[MWTool] (
    [mwHID]          INT            IDENTITY (1, 1) NOT NULL,
    [mwName]         NVARCHAR (255) NULL,
    [mwStyle]        NVARCHAR (255) NULL,
    [mwRadius]       NVARCHAR (255) NULL,
    [mwGrade]        NVARCHAR (255) NULL,
    [mwLocation]     NVARCHAR (255) NULL,
    [mwOn_Hand]      INT            NULL,
    [mwPhone]        NVARCHAR (50)  NULL,
    [mwManufacturer] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_MWTool1] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

