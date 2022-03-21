SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InsertOrUpdateFirmware]
	-- Add the parameters for the stored procedure here
	@firmwareName nvarchar(250),
	@firmwareVersion nvarchar(250),
	@firmwareStatus nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	/*if exists (select FirmwareVersionID from tblFirmwareVersions where FirmwareName=@firmwareName and FirmwareVersion=@firmwareVersion)
		begin
			update tblFirmwareVersions
			set DateUploaded=getdate(),
			[Status]=@firmwareStatus
			where FirmwareName=@firmwareName and FirmwareVersion=@firmwareVersion
		end
	else
		begin*/
			insert into tblFirmwareVersions
			values(
				getdate(),
				@firmwareName,
				@firmwareVersion,
				getdate(),
				@firmwareStatus,
				getdate()
			)
		--end

END
GO