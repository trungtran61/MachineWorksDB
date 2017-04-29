CREATE TABLE [dbo].[MWToolInventory] (
    [mwHID]           INT             IDENTITY (1, 1) NOT NULL,
    [mwItemNumber]    NVARCHAR (50)   CONSTRAINT [DF_MWToolInventory_mwItemNumber] DEFAULT ('') NULL,
    [mwName]          NVARCHAR (100)  CONSTRAINT [DF_MWToolInventory_mwName] DEFAULT ('') NULL,
    [mwCategoryID]    INT             NULL,
    [mwMWID]          NVARCHAR (50)   CONSTRAINT [DF_MWToolInventory_mwMWID] DEFAULT ('') NULL,
    [mwRadius]        NVARCHAR (50)   CONSTRAINT [DF_MWToolInventory_mwRadius] DEFAULT ('') NULL,
    [mwDiameter]      NVARCHAR (50)   CONSTRAINT [DF_MWToolInventory_mwDiameter] DEFAULT ('') NULL,
    [mwAngle]         NVARCHAR (50)   CONSTRAINT [DF_MWToolInventory_mwAngle] DEFAULT ('') NULL,
    [mwDirection]     NVARCHAR (100)  CONSTRAINT [DF_MWToolInventory_mwDirection] DEFAULT ('') NULL,
    [mwWidth]         NVARCHAR (50)   CONSTRAINT [DF_MWToolInventory_mwWidth] DEFAULT ('') NULL,
    [mwNumofCutter]   INT             CONSTRAINT [DF_MWToolInventory_mwNumofCutter] DEFAULT ((0)) NOT NULL,
    [mwMaxDepthofCut] NVARCHAR (50)   CONSTRAINT [DF_MWToolInventory_mwMaxDepthofCut] DEFAULT ('') NULL,
    [mwNumofFlutes]   INT             CONSTRAINT [DF_MWToolInventory_mwNumofFlutes] DEFAULT ((0)) NOT NULL,
    [mwFluteLength]   NVARCHAR (50)   CONSTRAINT [DF_MWToolInventory_mwFluteLength] DEFAULT ('') NULL,
    [mwOAL]           NVARCHAR (50)   CONSTRAINT [DF_MWToolInventory_mwOAL] DEFAULT ('') NULL,
    [mwShankDia]      NVARCHAR (50)   CONSTRAINT [DF_MWToolInventory_mwShankDia] DEFAULT ('') NULL,
    [mwChipBreaker]   NVARCHAR (100)  CONSTRAINT [DF_MWToolInventory_mwChipMaker] DEFAULT ('') NULL,
    [mwMaterial]      NVARCHAR (50)   CONSTRAINT [DF_MWToolInventory_mwMaterial] DEFAULT ('') NULL,
    [mwGrade]         NVARCHAR (50)   CONSTRAINT [DF_MWToolInventory_mwGrade] DEFAULT ('') NULL,
    [mwQty]           INT             CONSTRAINT [DF_MWToolInventory_mwQty] DEFAULT ((0)) NOT NULL,
    [mwQtyx]          INT             CONSTRAINT [DF_MWToolInventory_mwQtyx] DEFAULT ((0)) NOT NULL,
    [mwLocation]      NVARCHAR (100)  CONSTRAINT [DF_MWToolInventory_mwLocation] DEFAULT ('') NULL,
    [mwExtLocation]   NVARCHAR (100)  NULL,
    [mwOrderPoint]    DECIMAL (10, 2) CONSTRAINT [DF_MWToolInventory_mwOrderPoint] DEFAULT ((-1)) NOT NULL,
    [mwInvLevel]      DECIMAL (10, 2) CONSTRAINT [DF_MWToolInventory_mwInvLevel] DEFAULT ((0)) NOT NULL,
    [mwUnitPrice]     MONEY           CONSTRAINT [DF_MWToolInventory_mwUnitPrice] DEFAULT ((0)) NOT NULL,
    [mwManufacturer]  NVARCHAR (100)  CONSTRAINT [DF_MWToolInventory_mwToolManufacturer] DEFAULT ('') NULL,
    [mwCode]          NVARCHAR (50)   CONSTRAINT [DF_MWToolInventory_mwToolCode] DEFAULT ('') NULL,
    [mwVendorID]      INT             CONSTRAINT [DF_MWToolInventory_mwVendorID] DEFAULT ((0)) NOT NULL,
    [mwComment]       NVARCHAR (255)  CONSTRAINT [DF_MWToolInventory_mwComment] DEFAULT ('') NULL,
    [mwStatusID]      INT             CONSTRAINT [DF_MWToolInventory_mwStatus] DEFAULT ((0)) NULL,
    [mwImageCode]     NVARCHAR (20)   CONSTRAINT [DF_MWToolInventory_mwImageCode] DEFAULT ('ToolInventory') NULL,
    [POID]            INT             NULL,
    [PackSize]        DECIMAL (10, 2) NULL,
    [Unit]            VARCHAR (50)    NULL,
    [isLocked]        BIT             CONSTRAINT [DF_MWToolInventory_isLocked] DEFAULT ((0)) NOT NULL,
    [ToolGroupNum]    INT             NULL,
    [isSent]          BIT             NULL,
    [Description]     VARCHAR (1000)  NULL,
    [CuttingMethod]   VARCHAR (30)    NULL,
    [OrderApproved]   SMALLINT        CONSTRAINT [DF_MWToolInventory_OrderApproved] DEFAULT ((0)) NOT NULL,
    [NewAppDate]      DATETIME        NULL,
    CONSTRAINT [PK_MWToolInventory] PRIMARY KEY CLUSTERED ([mwHID] ASC),
    CONSTRAINT [FK_MWToolInventory_MWToolInventory] FOREIGN KEY ([mwStatusID]) REFERENCES [dbo].[MWToolInventory_Status] ([mwHID])
);


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[trg_MWToolInventory_Audit_Update]
   ON  dbo.MWToolInventory
   FOR UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Declare @AuditKey uniqueidentifier
	Select @AuditKey=NEWID()
	SET NOCOUNT ON;
	INSERT INTO MWToolInventory_Audit
		SELECT mwHID,mwItemNumber,mwName,mwCategoryID,mwMWID,mwRadius,mwDiameter,
mwAngle,mwDirection,mwWidth,mwNumofCutter,mwMaxDepthofCut,mwNumofFlutes,
mwFluteLength,mwOAL,mwShankDia,mwChipBreaker,mwMaterial,mwGrade,mwQty,mwQtyx,
mwLocation,mwExtLocation,mwOrderPoint,mwInvLevel,mwUnitPrice,mwManufacturer,
mwCode,mwVendorID,mwComment,mwStatusID,mwImageCode,POID,PackSize,Unit,isLocked,
ToolGroupNum,isSent,Description,CuttingMethod,OrderApproved,NewAppDate,
GetDate(), 'Before Update', 1, @AuditKey From deleted

INSERT INTO MWToolInventory_Audit
		SELECT mwHID,mwItemNumber,mwName,mwCategoryID,mwMWID,mwRadius,mwDiameter,
mwAngle,mwDirection,mwWidth,mwNumofCutter,mwMaxDepthofCut,mwNumofFlutes,
mwFluteLength,mwOAL,mwShankDia,mwChipBreaker,mwMaterial,mwGrade,mwQty,mwQtyx,
mwLocation,mwExtLocation,mwOrderPoint,mwInvLevel,mwUnitPrice,mwManufacturer,
mwCode,mwVendorID,mwComment,mwStatusID,mwImageCode,POID,PackSize,Unit,isLocked,
ToolGroupNum,isSent,Description,CuttingMethod,OrderApproved,NewAppDate, 
GetDate(), 'After Update', 2, @AuditKey From inserted 

END
