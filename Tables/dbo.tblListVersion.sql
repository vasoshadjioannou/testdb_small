CREATE TABLE [dbo].[tblListVersion] (
  [ListVersionId] [bigint] IDENTITY,
  [Entry Date] [datetime] NULL,
  [Version No] [bigint] NULL,
  [List_Id] [bigint] NULL,
  [Filename] [nvarchar](200) NULL,
  [Date] [datetime] NULL,
  [Last Updated] [datetime] NULL,
  [ListSize] [nvarchar](4000) NULL,
  PRIMARY KEY CLUSTERED ([ListVersionId])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblListVersion]
  ADD FOREIGN KEY ([List_Id]) REFERENCES [dbo].[tblLists] ([listID])
GO