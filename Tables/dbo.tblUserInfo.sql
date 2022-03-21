CREATE TABLE [dbo].[tblUserInfo] (
  [UserKeysID] [bigint] IDENTITY,
  [EntryDate] [datetime] NULL,
  [UserId] [bigint] NULL,
  [PrivateKey] [nvarchar](250) NULL,
  [PublicKey] [nvarchar](250) NULL,
  [Privileges] [nvarchar](250) NULL,
  [IncrementalActionIdentifier] [int] NULL,
  [LastUpdated] [datetime] NULL,
  CONSTRAINT [PK_tblUserKeys] PRIMARY KEY CLUSTERED ([UserKeysID])
)
ON [PRIMARY]
GO