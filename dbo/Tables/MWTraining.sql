CREATE TABLE [dbo].[MWTraining] (
    [mwHID]        INT            IDENTITY (1, 1) NOT NULL,
    [mwInits]      NVARCHAR (5)   NULL,
    [mwFirstName]  NVARCHAR (50)  NULL,
    [mwLastName]   NVARCHAR (50)  NULL,
    [mwEmployeeID] NVARCHAR (30)  NULL,
    [mwCategory]   NVARCHAR (100) NULL,
    [mwTrainer]    NVARCHAR (50)  NULL,
    [mwTopic]      NVARCHAR (MAX) NULL,
    [mwDate]       DATETIME       NULL,
    [mwComment]    NVARCHAR (255) NULL,
    CONSTRAINT [PK_MWTraining] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

