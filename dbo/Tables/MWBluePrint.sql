CREATE TABLE [dbo].[MWBluePrint] (
    [mwHID]        INT             IDENTITY (1, 1) NOT NULL,
    [mwWorkOrder]  NVARCHAR (50)   CONSTRAINT [DF_MWBluePrint_mwWorkOrder] DEFAULT ('') NULL,
    [mwPartNumber] NVARCHAR (50)   NULL,
    [mwRevision]   NVARCHAR (50)   NULL,
    [mwComment]    NVARCHAR (1000) CONSTRAINT [DF_MWBluePrint_mwComment] DEFAULT ('') NULL,
    CONSTRAINT [PK_MWBluePrint] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

