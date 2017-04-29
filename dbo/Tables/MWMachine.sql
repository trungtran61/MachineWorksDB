CREATE TABLE [dbo].[MWMachine] (
    [mwHID]         INT            IDENTITY (1, 1) NOT NULL,
    [mwMachineID]   NVARCHAR (12)  NULL,
    [mwName]        NVARCHAR (100) NULL,
    [mwManufacture] NVARCHAR (100) NULL,
    [mwModel]       NVARCHAR (100) NULL,
    [mwSerial]      NVARCHAR (100) NULL,
    [mwType]        NVARCHAR (50)  NULL,
    [mwDaily]       DATETIME       NULL,
    [mwQuarterly]   DATETIME       NULL,
    [mwAnnually]    DATETIME       NULL,
    [mwSchedule]    NVARCHAR (5)   NULL,
    [mwProcedure]   NVARCHAR (100) NULL,
    [mwPassword]    NVARCHAR (12)  NULL,
    [mwActive]      NVARCHAR (5)   CONSTRAINT [DF_MWMachine_mwActive] DEFAULT ('Yes') NULL,
    CONSTRAINT [PK_MWMachine] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MWMachine]
    ON [dbo].[MWMachine]([mwMachineID] ASC);

