SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RetrieveGatewaySensors] 
	-- Add the parameters for the stored procedure here
	@zoneName nvarchar(250), @gatewayName nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	select	s.SensorID,
			s.SensorIdentifier as 'sensor_name',
			sd.SensorType as 'sensor_type',
			sd.SensorIcon as 'sensor_icon',
			sd.LocX as 'loc_x',
			sd.LocY as 'loc_y'
	from tblSensors s
	inner join tblSensorDetails sd on sd.SensorIdentifier=s.SensorIdentifier
	where s.ZoneName=@zoneName and s.GatewayName=@gatewayName

END
GO