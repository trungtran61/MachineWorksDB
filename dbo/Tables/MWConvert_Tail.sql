CREATE TABLE [dbo].[MWConvert_Tail] (
    [mwHID]    INT             IDENTITY (1, 1) NOT NULL,
    [mwRuleID] INT             NULL,
    [mwFirst]  NVARCHAR (4000) NULL,
    [mwSecond] NVARCHAR (4000) NULL,
    CONSTRAINT [PK_MWConvert_Tail] PRIMARY KEY CLUSTERED ([mwHID] ASC),
    CONSTRAINT [FK_MWConvert_Tail_MWConvert_Head] FOREIGN KEY ([mwRuleID]) REFERENCES [dbo].[MWConvert_Head] ([mwHID])
);

