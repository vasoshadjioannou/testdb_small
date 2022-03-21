SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CheckIfSensorExists]
	-- Add the parameters for the stored procedure here
	
	@newSensorName nvarchar(250),
	@newSensorZone nvarchar(250),
	@newSensorGateway nvarchar(250)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	declare @result bit=0

	/*if exists (	select SensorID 
				from tblSensors 
				where ZoneName=@newSensorZone
				and GatewayName=@newSensorGateway
				and SensorIdentifier=@newSensorName)
		set @result=1*/

	select @result
END
GO