CREATE TABLE [dbo].[tblSensorValues] (
  [SensorValueID] [bigint] IDENTITY,
  [EntryDate] [datetime] NULL,
  [SensorIdentifier] [nvarchar](250) NULL,
  [SensorMetric] [nvarchar](250) NULL,
  [SensorValue] [nvarchar](250) NULL,
  [Timestamp] [nvarchar](250) NULL,
  [PackagId] [nvarchar](250) NULL,
  [LastUpdated] [datetime] NULL,
  [TimestampDateTime] [datetime] NULL,
  CONSTRAINT [PK_tblSensorValues] PRIMARY KEY CLUSTERED ([SensorValueID])
)
ON [PRIMARY]
GO