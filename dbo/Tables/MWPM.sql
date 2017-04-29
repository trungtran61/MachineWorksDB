CREATE TABLE [dbo].[MWPM] (
    [mwHID]          INT            IDENTITY (1, 1) NOT NULL,
    [mwMachineID]    NVARCHAR (12)  NULL,
    [mwOPName]       NVARCHAR (100) NULL,
    [mwBadgeID]      NVARCHAR (10)  NULL,
    [mwStatus]       NVARCHAR (12)  NULL,
    [mwDateSchedule] DATETIME       NULL,
    [mwDateComplete] DATETIME       NULL,
    [mwLevel]        NVARCHAR (12)  NULL,
    [mwLate]         INT            NULL,
    CONSTRAINT [PK_MWPM] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);

