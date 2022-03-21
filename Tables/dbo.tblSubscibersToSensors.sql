CREATE TABLE [dbo].[tblSubscibersToSensors] (
  [SubscriberToSensorID] [bigint] IDENTITY,
  [EntryDate] [datetime] NULL,
  [Subscriber_ID] [bigint] NULL,
  [SensorIdentifier] [nvarchar](250) NULL,
  [LastUpdated] [datetime] NULL,
  CONSTRAINT [PK_tblSubscibersToSensors] PRIMARY KEY CLUSTERED ([SubscriberToSensorID])
)
ON [PRIMARY]
GO