CREATE TABLE [dbo].[MWMaterial] (
    [mwHID]        INT             IDENTITY (1, 1) NOT NULL,
    [mwPartNumber] NVARCHAR (50)   CONSTRAINT [DF_MWMaterial_mwPartNumber] DEFAULT ('') NULL,
    [mwRevision]   NVARCHAR (50)   CONSTRAINT [DF_MWMaterial_mwRevision] DEFAULT ('') NULL,
    [mwWorkOrder]  NVARCHAR (50)   CONSTRAINT [DF_MWMaterial_mwWorkOrder] DEFAULT ('') NULL,
    [mwType]       NVARCHAR (50)   CONSTRAINT [DF_MWMaterial_mwType] DEFAULT ('') NULL,
    [mwSize]       NVARCHAR (50)   CONSTRAINT [DF_MWMaterial_mwSize] DEFAULT ('') NULL,
    [mwQty]        INT             CONSTRAINT [DF_MWMaterial_mwQty] DEFAULT ((0)) NULL,
    [mwUnit]       NVARCHAR (50)   CONSTRAINT [DF_MWMaterial_mwUnit] DEFAULT ('') NULL,
    [mwLocation]   NVARCHAR (255)  CONSTRAINT [DF_MWMaterial_mwLocation] DEFAULT ('') NULL,
    [mwAms]        NVARCHAR (50)   CONSTRAINT [DF_MWMaterial_mwAms] DEFAULT ('') NULL,
    [mwHeatLot]    NVARCHAR (50)   CONSTRAINT [DF_MWMaterial_mwHeatLot] DEFAULT ('') NULL,
    [mwVendorID]   INT             CONSTRAINT [DF_MWMaterial_mwVendorID] DEFAULT ((0)) NULL,
    [mwComment]    NVARCHAR (1000) CONSTRAINT [DF_MWMaterial_mwComment] DEFAULT ('') NULL,
    CONSTRAINT [PK_MWMaterial_1] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

