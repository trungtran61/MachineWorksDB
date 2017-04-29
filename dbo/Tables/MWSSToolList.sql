CREATE TABLE [dbo].[MWSSToolList] (
    [mwToolID]      INT             CONSTRAINT [DF_MWSSToolList_mwToolID] DEFAULT ((0)) NULL,
    [mwNNo]         NVARCHAR (50)   NULL,
    [mwToolNo]      NVARCHAR (10)   NULL,
    [mwTO]          NVARCHAR (50)   NULL,
    [mwTLO]         NVARCHAR (50)   NULL,
    [mwCCO]         NVARCHAR (50)   NULL,
    [mwName]        NVARCHAR (255)  NULL,
    [mwDescription] NVARCHAR (1000) NULL,
    [mwGrade]       NVARCHAR (50)   NULL,
    [mwComment]     NVARCHAR (1000) NULL,
    [mwSortOrder]   INT             CONSTRAINT [DF_MWSSToolList_mwSortOrder] DEFAULT ((0)) NULL,
    [mwSheetID]     INT             CONSTRAINT [DF_MWSSToolList_mwSheetID] DEFAULT ((0)) NULL,
    [mwTH1]         INT             NULL,
    [mwTH2]         INT             NULL,
    [mwTH3]         INT             NULL,
    [mwTH4]         INT             NULL
);

