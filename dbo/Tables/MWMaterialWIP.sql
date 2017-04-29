CREATE TABLE [dbo].[MWMaterialWIP] (
    [HID]      INT             NOT NULL,
    [Qty]      DECIMAL (10, 2) NULL,
    [Unit]     VARCHAR (50)    NULL,
    [Location] VARCHAR (500)   NULL,
    CONSTRAINT [PK_MWMaterialWIP] PRIMARY KEY CLUSTERED ([HID] ASC)
);

