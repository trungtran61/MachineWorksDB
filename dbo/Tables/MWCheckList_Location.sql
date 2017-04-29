CREATE TABLE [dbo].[MWCheckList_Location] (
    [mwLocation] NVARCHAR (50) NOT NULL,
    [mwActive]   NVARCHAR (5)  CONSTRAINT [DF_MWCheckList_Location_mwActive] DEFAULT ('Yes') NULL,
    CONSTRAINT [PK_MWCheckList_Location] PRIMARY KEY CLUSTERED ([mwLocation] ASC)
);

