CREATE TABLE [dbo].[tblSensors] (
  [SensorID] [bigint] IDENTITY,
  [EntryDate] [datetime] NULL,
  [ZoneName] [nvarchar](250) NULL,
  [GatewayName] [nvarchar](250) NULL,
  [SensorIdentifier] [nvarchar](250) NULL,
  [LastUpdated] [datetime] NULL,
  CONSTRAINT [PK_tblSensors] PRIMARY KEY CLUSTERED ([SensorID])
)
ON [PRIMARY]
GO