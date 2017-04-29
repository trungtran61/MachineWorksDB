CREATE TABLE [dbo].[MWImage] (
    [mwHID]      INT            IDENTITY (1, 1) NOT NULL,
    [mwName]     NVARCHAR (50)  CONSTRAINT [DF_MWImage_mwName] DEFAULT ('') NULL,
    [mwFolder]   NVARCHAR (100) CONSTRAINT [DF_MWImage_mwPath] DEFAULT ('') NULL,
    [mwFileName] NVARCHAR (50)  CONSTRAINT [DF_MWImage_mwFileName] DEFAULT ('') NULL,
    [mwCode]     NVARCHAR (20)  CONSTRAINT [DF_MWImage_mwCode] DEFAULT ('') NULL,
    [mwCodeID]   INT            CONSTRAINT [DF_MWImage_mwCodeID] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_MWImage] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

