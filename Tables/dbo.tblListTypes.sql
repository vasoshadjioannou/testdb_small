CREATE TABLE [dbo].[tblListTypes] (
  [ListTypeID] [bigint] IDENTITY,
  [List Type] [nvarchar](400) NULL,
  CONSTRAINT [PK_tblListTypes] PRIMARY KEY CLUSTERED ([ListTypeID])
)
ON [PRIMARY]
GO