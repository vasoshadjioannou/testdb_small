SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InsertFirmwareUpdateStatus]
	-- Add the parameters for the stored procedure here
	@EventCode nvarchar(250),
	@EventText nvarchar(250),
	@ErrorCode nvarchar(250),
	@SerialNumber nvarchar(250),
	@gateway nvarchar(250)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	insert into tblFirmwareUpdateStatuses
	values(
		getdate(),
		@EventCode,
		@EventText,
		@ErrorCode,
		@SerialNumber,
		0,
		@gateway,
		getdate()
	)

END
GO