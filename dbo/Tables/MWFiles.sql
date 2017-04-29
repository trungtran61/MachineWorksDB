CREATE TABLE [dbo].[MWFiles] (
    [mwHID]        INT            IDENTITY (1, 1) NOT NULL,
    [mwName]       NVARCHAR (500) NULL,
    [mwType]       NVARCHAR (50)  NULL,
    [mwLen]        INT            NULL,
    [mwExt]        NVARCHAR (50)  NULL,
    [mwCreated]    DATETIME       NULL,
    [mwModified]   DATETIME       NULL,
    [mwModifiedBy] NVARCHAR (50)  NULL,
    [mwGrpID]      INT            CONSTRAINT [DF_MWFiles_mwDocTypeID] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_MWFiles] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

