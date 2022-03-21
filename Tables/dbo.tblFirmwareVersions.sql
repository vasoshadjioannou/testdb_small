CREATE TABLE [dbo].[tblFirmwareVersions] (
  [FirmwareVersionID] [bigint] IDENTITY,
  [EntryDate] [datetime] NULL,
  [FirmwareName] [nvarchar](250) NULL,
  [FirmwareVersion] [nvarchar](250) NULL,
  [DateUploaded] [datetime] NULL,
  [Status] [nvarchar](250) NULL,
  [LastUpdated] [datetime] NULL,
  CONSTRAINT [PK_tblFirmwareVersions] PRIMARY KEY CLUSTERED ([FirmwareVersionID])
)
ON [PRIMARY]
GO