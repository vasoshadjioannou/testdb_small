SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RetrieveSensorHourAverage]
	-- Add the parameters for the stored procedure here
	@sensorIdentifier nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	select isnull(	(select avg(convert(float, AlertSeverity)) 
					from tblSensorAlerts 
					where SensorIdentifier=@sensorIdentifier
					and (select convert(datetime, (select top 1* from Split(replace(AlertTime, 'T', ' '), '.')))) > (select DATEADD(hour, -1, getdate())))
			, 0)

	
	
	
			

END
GO