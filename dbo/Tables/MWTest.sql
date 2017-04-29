CREATE TABLE [dbo].[MWTest] (
    [mwHID]       INT        IDENTITY (1, 1) NOT NULL,
    [mwFirstName] NCHAR (10) NULL,
    [mwLastName]  NCHAR (10) NULL,
    CONSTRAINT [PK_MWTest] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

