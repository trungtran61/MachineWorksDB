﻿CREATE TABLE [dbo].[MWUOM] (
    [ID]      INT           IDENTITY (1, 1) NOT NULL,
    [UOM]     NVARCHAR (10) NULL,
    [UOMLong] NVARCHAR (20) NULL,
    CONSTRAINT [PK_MWUOM] PRIMARY KEY CLUSTERED ([ID] ASC)
);

