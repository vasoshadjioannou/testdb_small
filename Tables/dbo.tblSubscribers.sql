CREATE TABLE [dbo].[tblSubscribers] (
  [SubscriberID] [bigint] IDENTITY,
  [EntryDate] [datetime] NULL,
  [User_ID] [bigint] NULL,
  [SubscriberName] [nvarchar](250) NULL,
  [LastUpdated] [datetime] NULL,
  CONSTRAINT [PK_tblSubscribers] PRIMARY KEY CLUSTERED ([SubscriberID])
)
ON [PRIMARY]
GO