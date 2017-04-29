CREATE TABLE [dbo].[MWFileGrps] (
    [mwHID]       INT           IDENTITY (1, 1) NOT NULL,
    [mwName]      NVARCHAR (50) NULL,
    [mwEnabled]   BIT           CONSTRAINT [DF_MWDocGrp_mwEnabled] DEFAULT ((1)) NULL,
    [mwSortOrder] INT           CONSTRAINT [DF_MWDocGrp_mwSortOrder] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_MWDocGrp] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

