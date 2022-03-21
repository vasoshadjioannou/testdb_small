CREATE TABLE [dbo].[tblZones] (
  [ZoneID] [bigint] IDENTITY,
  [EntryDate] [datetime] NULL,
  [ZoneName] [nvarchar](250) NULL,
  [ZoneUrl] [nvarchar](2000) NULL,
  [LastUpdated] [datetime] NULL,
  CONSTRAINT [PK_tblZones] PRIMARY KEY CLUSTERED ([ZoneID])
)
ON [PRIMARY]
GO