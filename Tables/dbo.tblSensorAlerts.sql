CREATE TABLE [dbo].[tblSensorAlerts] (
  [SensorAlertID] [bigint] IDENTITY,
  [EntryDate] [datetime] NULL,
  [ZoneName] [nvarchar](250) NULL,
  [AlertTime] [nvarchar](250) NULL,
  [AlertIdentifier] [nvarchar](250) NULL,
  [AlertMessage] [nvarchar](250) NULL,
  [AlertName] [nvarchar](250) NULL,
  [SensorIdentifier] [nvarchar](250) NULL,
  [AlertSeverity] [nvarchar](250) NULL,
  [LastUpdated] [datetime] NULL,
  [Seen] [bit] NULL,
  [AlertTimeDateTime] [datetime] NULL,
  CONSTRAINT [PK_tblSensorAlerts] PRIMARY KEY CLUSTERED ([SensorAlertID])
)
ON [PRIMARY]
GO