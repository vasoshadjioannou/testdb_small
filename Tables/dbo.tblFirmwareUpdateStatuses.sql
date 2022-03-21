CREATE TABLE [dbo].[tblFirmwareUpdateStatuses] (
  [FirmwareUpdateStatusID] [bigint] IDENTITY,
  [EntryDate] [datetime] NULL,
  [EventCode] [nvarchar](250) NULL,
  [EventText] [nvarchar](250) NULL,
  [ErrorCode] [nvarchar](250) NULL,
  [SerialNumber] [nvarchar](250) NULL,
  [IsRead] [bit] NULL,
  [gateway] [nvarchar](250) NULL,
  [LastUpdated] [datetime] NULL,
  CONSTRAINT [PK_tblFirmwareUpdateStatuses] PRIMARY KEY CLUSTERED ([FirmwareUpdateStatusID])
)
ON [PRIMARY]
GO