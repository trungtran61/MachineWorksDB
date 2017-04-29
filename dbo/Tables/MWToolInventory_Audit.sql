﻿CREATE TABLE [dbo].[MWToolInventory_Audit] (
    [mwHID]           INT              NOT NULL,
    [mwItemNumber]    NVARCHAR (50)    NULL,
    [mwName]          NVARCHAR (100)   NULL,
    [mwCategoryID]    INT              NULL,
    [mwMWID]          NVARCHAR (50)    NULL,
    [mwRadius]        NVARCHAR (50)    NULL,
    [mwDiameter]      NVARCHAR (50)    NULL,
    [mwAngle]         NVARCHAR (50)    NULL,
    [mwDirection]     NVARCHAR (100)   NULL,
    [mwWidth]         NVARCHAR (50)    NULL,
    [mwNumofCutter]   INT              NOT NULL,
    [mwMaxDepthofCut] NVARCHAR (50)    NULL,
    [mwNumofFlutes]   INT              NOT NULL,
    [mwFluteLength]   NVARCHAR (50)    NULL,
    [mwOAL]           NVARCHAR (50)    NULL,
    [mwShankDia]      NVARCHAR (50)    NULL,
    [mwChipBreaker]   NVARCHAR (100)   NULL,
    [mwMaterial]      NVARCHAR (50)    NULL,
    [mwGrade]         NVARCHAR (50)    NULL,
    [mwQty]           DECIMAL (10, 2)  NOT NULL,
    [mwQtyx]          INT              NOT NULL,
    [mwLocation]      NVARCHAR (100)   NULL,
    [mwExtLocation]   NVARCHAR (100)   NULL,
    [mwOrderPoint]    DECIMAL (10, 2)  NOT NULL,
    [mwInvLevel]      DECIMAL (10, 2)  NOT NULL,
    [mwUnitPrice]     MONEY            NOT NULL,
    [mwManufacturer]  NVARCHAR (100)   NULL,
    [mwCode]          NVARCHAR (50)    NULL,
    [mwVendorID]      INT              NOT NULL,
    [mwComment]       NVARCHAR (255)   NULL,
    [mwStatusID]      INT              NULL,
    [mwImageCode]     NVARCHAR (20)    NULL,
    [POID]            INT              NULL,
    [PackSize]        DECIMAL (10, 2)  NULL,
    [Unit]            VARCHAR (50)     NULL,
    [isLocked]        BIT              NOT NULL,
    [ToolGroupNum]    INT              NULL,
    [isSent]          BIT              NULL,
    [Description]     VARCHAR (1000)   NULL,
    [CuttingMethod]   VARCHAR (30)     NULL,
    [OrderApproved]   SMALLINT         NOT NULL,
    [NewAppDate]      DATETIME         NULL,
    [Modified]        DATETIME         NULL,
    [ModifiedBy]      VARCHAR (50)     NULL,
    [Sequence]        INT              NULL,
    [AuditKey]        UNIQUEIDENTIFIER NULL
);
