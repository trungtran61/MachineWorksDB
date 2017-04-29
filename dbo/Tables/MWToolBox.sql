CREATE TABLE [dbo].[MWToolBox] (
    [mwHID]        INT            IDENTITY (1, 1) NOT NULL,
    [mwPartNumber] NVARCHAR (50)  NULL,
    [mwRevision]   NVARCHAR (100) NULL,
    [mwOP]         NVARCHAR (5)   NULL,
    [mwMachine]    NVARCHAR (100) NULL,
    [mwImageCode]  NVARCHAR (20)  CONSTRAINT [DF_MWToolBox_mwImageCode] DEFAULT ('ToolBox') NULL,
    [mwSheetID]    INT            CONSTRAINT [DF_MWToolBox_mwSheetID] DEFAULT ((-1)) NULL,
    CONSTRAINT [PK_MWToolBox] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

