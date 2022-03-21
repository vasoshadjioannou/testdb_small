SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RetrieveZoneGateways]
	-- Add the parameters for the stored procedure here
	@zoneName nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	select	ZoneName as 'zone_name',
			GatewayName as 'name',
			GatewayName as 'gateway_name',
			LocX as 'loc_x',
			LocY as 'loc_y'
	from tblGateways 
	where ZoneName=@zoneName

END
GO