CREATE TABLE [dbo].[MWToolInventory_Category] (
    [mwHID]     INT            IDENTITY (1, 1) NOT NULL,
    [mwCatName] NVARCHAR (100) NULL,
    CONSTRAINT [PK_MWToolInventory_Category] PRIMARY KEY CLUSTERED ([mwHID] ASC)
);


GO
CREATE TRIGGER trigSecurityCatA_Insert ON MWToolInventory_Category FOR INSERT AS EXEC spSecurityCatA_Insert