CREATE TABLE [dbo].[tblLists] (
  [listID] [bigint] IDENTITY,
  [Entry Date] [datetime] NULL,
  [List Name] [nvarchar](4000) NULL,
  [List Url] [nvarchar](4000) NULL,
  [HasRssFeed] [bit] NULL,
  [HasProcessed] [bit] NULL,
  [Last Processed Date] [date] NULL,
  [Abbreviation] [nvarchar](4000) NULL,
  [Country_ID] [bigint] NULL,
  [ListType_ID] [bigint] NULL,
  [Description] [nvarchar](4000) NULL,
  [List Source] [nvarchar](4000) NULL,
  [NoOfRecords] [bigint] NULL,
  [Last Updated] [datetime] NULL,
  [Cache] [nvarchar](50) NULL,
  CONSTRAINT [PK_tblLists] PRIMARY KEY CLUSTERED ([listID])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblLists]
  ADD CONSTRAINT [FK_tblLists_tblListTypes] FOREIGN KEY ([ListType_ID]) REFERENCES [dbo].[tblListTypes] ([ListTypeID])
GO