SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RetrieveSensorAlerts]
	-- Add the parameters for the stored procedure here
	@sensorIdentifier nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	select	AlertTime as 'time',
			AlertIdentifier as 'id',
			AlertMessage as 'message',
			AlertName as 'name',
			SensorIdentifier as 'sensor_id',
			AlertSeverity as 'severity'
	from tblSensorAlerts 
	where SensorIdentifier=@sensorIdentifier
	order by EntryDate desc

END
GO