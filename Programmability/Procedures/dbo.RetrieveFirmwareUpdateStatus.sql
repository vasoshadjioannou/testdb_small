SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RetrieveFirmwareUpdateStatus]
	-- Add the parameters for the stored procedure here
	@gateway nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from tblFirmwareUpdateStatuses
	where IsRead=0
	--and gateway=@gateway
	and gateway='gateway_049162647A43'

	update tblFirmwareUpdateStatuses
	set IsRead=1
	--where gateway=@gateway
	where gateway='gateway_049162647A43'

END
GO