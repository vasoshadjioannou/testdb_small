CREATE TABLE [dbo].[tblSensorInfo] (
  [SensorInfoID] [bigint] IDENTITY,
  [EntryDate] [datetime] NULL,
  [SensorId] [nvarchar](2000) NULL,
  [SensorPublicKey] [nvarchar](2000) NULL,
  [SensorPrivateKey] [nvarchar](2000) NULL,
  [LastUpdated] [datetime] NULL,
  CONSTRAINT [PK_tblSensorInfo] PRIMARY KEY CLUSTERED ([SensorInfoID])
)
ON [PRIMARY]
GO