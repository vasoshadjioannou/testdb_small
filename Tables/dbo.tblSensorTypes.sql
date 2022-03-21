CREATE TABLE [dbo].[tblSensorTypes] (
  [SensorTypeID] [bigint] IDENTITY,
  [EntryDate] [datetime] NULL,
  [SensorTypeName] [nvarchar](250) NULL,
  [LastUpdated] [datetime] NULL,
  CONSTRAINT [PK_tblSensorTypes] PRIMARY KEY CLUSTERED ([SensorTypeID])
)
ON [PRIMARY]
GO