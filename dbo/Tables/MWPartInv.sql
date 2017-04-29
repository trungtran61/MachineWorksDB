CREATE TABLE [dbo].[MWPartInv] (
    [mwHID]         INT             IDENTITY (1, 1) NOT NULL,
    [mwPartNumber]  NVARCHAR (50)   CONSTRAINT [DF_MWPartInv_mwPartNumber] DEFAULT ('') NULL,
    [mwRevision]    NVARCHAR (20)   CONSTRAINT [DF_MWPartInv_mwRevision] DEFAULT ('') NULL,
    [mwOrderPoint]  INT             CONSTRAINT [DF_MWPartInv_mwOrderPoint] DEFAULT ((-1)) NULL,
    [mwInvLevel]    INT             CONSTRAINT [DF_MWPartInv_mwInvLevel] DEFAULT ((0)) NULL,
    [mwInstruction] NVARCHAR (1000) CONSTRAINT [DF_MWPartInv_mwInstruction] DEFAULT ('') NULL,
    CONSTRAINT [PK_MWPartInv] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

