CREATE TABLE [dbo].[tblSensorDetails] (
  [SensorDetailID] [bigint] IDENTITY,
  [EntryDate] [datetime] NULL,
  [ZoneName] [nvarchar](250) NULL,
  [GatewayName] [nvarchar](250) NULL,
  [SensorIdentifier] [nvarchar](250) NULL,
  [SensorType] [nvarchar](250) NULL,
  [SensorIcon] [nvarchar](250) NULL,
  [LocX] [nvarchar](250) NULL,
  [LocY] [nvarchar](250) NULL,
  [LastUpdated] [datetime] NULL,
  CONSTRAINT [PK_tblSensorDetails] PRIMARY KEY CLUSTERED ([SensorDetailID])
)
ON [PRIMARY]
GO