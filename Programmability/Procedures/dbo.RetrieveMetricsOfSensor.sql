SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RetrieveMetricsOfSensor]
	
	@sensor nvarchar(250)

AS
BEGIN
	
	select distinct SensorMetric 
	from tblSensorValues 
	where SensorIdentifier=@sensor
	and SensorMetric != 'id'
	and SensorMetric != 'face'
	and SensorMetric != 'presence'

END
GO