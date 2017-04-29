CREATE TABLE [dbo].[MWSpecification] (
    [mwHID]         INT             IDENTITY (1, 1) NOT NULL,
    [mwWorkOrder]   NVARCHAR (50)   CONSTRAINT [DF_MWSpecification_mwWorkOrder] DEFAULT ('') NULL,
    [mwPartNumber]  NVARCHAR (50)   CONSTRAINT [DF_MWSpecification_mwPartNumber] DEFAULT ('') NULL,
    [mwRevision]    NVARCHAR (50)   CONSTRAINT [DF_MWSpecification_mwRevision] DEFAULT ('') NULL,
    [mwOP]          INT             NULL,
    [mwSpecOwner]   NVARCHAR (50)   CONSTRAINT [DF_MWSpecification_mwSpecOwner] DEFAULT ('') NULL,
    [mwSpecNum]     NVARCHAR (50)   CONSTRAINT [DF_MWSpecification_mwSpecNum] DEFAULT ('') NULL,
    [mwDescription] NVARCHAR (1000) CONSTRAINT [DF_MWSpecification_mwDescription] DEFAULT ('') NULL,
    [mwPageParap]   NVARCHAR (50)   CONSTRAINT [DF_MWSpecification_mwPageParap] DEFAULT ('') NULL,
    [mwVendorID]    INT             CONSTRAINT [DF_MWSpecification_mwVendorID] DEFAULT ((0)) NULL,
    [mwComment]     NVARCHAR (1000) CONSTRAINT [DF_MWSpecification_mwComment] DEFAULT ('') NULL,
    CONSTRAINT [PK_MWSpecification] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

