CREATE TABLE [dbo].[MWHelp] (
    [mwHID]          INT             IDENTITY (1, 1) NOT NULL,
    [mwTitle]        NVARCHAR (255)  NULL,
    [mwDescription1] NVARCHAR (4000) NULL,
    [mwDescription2] NVARCHAR (3500) NULL,
    CONSTRAINT [PK_MWHelp] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

