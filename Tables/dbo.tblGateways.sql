CREATE TABLE [dbo].[tblGateways] (
  [GatewayID] [bigint] IDENTITY,
  [EntryDate] [datetime] NULL,
  [ZoneName] [nvarchar](250) NULL,
  [GatewayName] [nvarchar](250) NULL,
  [LocX] [nvarchar](250) NULL,
  [LocY] [nvarchar](250) NULL,
  [LastUpdated] [datetime] NULL,
  CONSTRAINT [PK_tblGateways] PRIMARY KEY CLUSTERED ([GatewayID])
)
ON [PRIMARY]
GO