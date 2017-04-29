CREATE TABLE [dbo].[MWEmployees] (
    [mwEmployeeID]         NVARCHAR (30)  NOT NULL,
    [mwEID]                NVARCHAR (30)  NULL,
    [mwFirstName]          NVARCHAR (50)  CONSTRAINT [DF_MWEmployees_mwFirstName] DEFAULT ('') NULL,
    [mwMiddleName]         NVARCHAR (30)  CONSTRAINT [DF_MWEmployees_mwMiddleName] DEFAULT ('') NULL,
    [mwLastName]           NVARCHAR (50)  CONSTRAINT [DF_MWEmployees_mwLastName] DEFAULT ('') NULL,
    [mwTitle]              NVARCHAR (50)  CONSTRAINT [DF_MWEmployees_mwTitle] DEFAULT ('') NULL,
    [mwEmail]              NVARCHAR (100) CONSTRAINT [DF_MWEmployees_mwEmail] DEFAULT ('') NULL,
    [mwSSN]                NVARCHAR (30)  CONSTRAINT [DF_MWEmployees_mwSSN] DEFAULT ('') NULL,
    [mwAddress]            NVARCHAR (255) CONSTRAINT [DF_MWEmployees_mwAddress] DEFAULT ('') NULL,
    [mwCity]               NVARCHAR (50)  CONSTRAINT [DF_MWEmployees_mwCity] DEFAULT ('') NULL,
    [mwState]              NVARCHAR (20)  CONSTRAINT [DF_MWEmployees_mwState] DEFAULT ('') NULL,
    [mwZip]                NVARCHAR (20)  CONSTRAINT [DF_MWEmployees_mwZip] DEFAULT ('') NULL,
    [mwCountry]            NVARCHAR (50)  CONSTRAINT [DF_MWEmployees_mwCountry] DEFAULT (N'United States') NULL,
    [mwHomePhone]          NVARCHAR (30)  CONSTRAINT [DF_MWEmployees_mwHomePhone] DEFAULT ('') NULL,
    [mwWorkPhone]          NVARCHAR (30)  CONSTRAINT [DF_MWEmployees_mwWorkPhone] DEFAULT ('') NULL,
    [mwCellPhone]          NVARCHAR (30)  CONSTRAINT [DF_MWEmployees_mwCellPhone] DEFAULT ('') NULL,
    [mwBirthdate]          DATETIME       CONSTRAINT [DF_MWEmployees_mwBirthdate] DEFAULT ('') NULL,
    [mwHiredDate]          DATETIME       CONSTRAINT [DF_MWEmployees_mwHiredDate] DEFAULT ('') NULL,
    [mwTerminatedDate]     DATETIME       CONSTRAINT [DF_MWEmployees_mwTerminatedDate] DEFAULT ('') NULL,
    [mwEmrgcyContactName]  NVARCHAR (50)  CONSTRAINT [DF_MWEmployees_mwEmrgcyContactName] DEFAULT ('') NULL,
    [mwEmrgcyContactPhone] NVARCHAR (30)  CONSTRAINT [DF_MWEmployees_mwEmrgcyContactPhone] DEFAULT ('') NULL,
    [mwNote]               NTEXT          CONSTRAINT [DF_MWEmployees_mwNotes] DEFAULT ('') NULL,
    [mwActive]             NCHAR (3)      CONSTRAINT [DF_MWEmployees_mwActive] DEFAULT (N'Yes') NULL,
    CONSTRAINT [PK_MWEmployees_1] PRIMARY KEY CLUSTERED ([mwEmployeeID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MWEmployees]
    ON [dbo].[MWEmployees]([mwEmployeeID] ASC);

