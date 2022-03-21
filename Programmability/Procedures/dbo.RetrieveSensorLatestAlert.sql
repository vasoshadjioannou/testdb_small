SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[RetrieveSensorLatestAlert]
	-- Add the parameters for the stored procedure here
	@sensorIdentifier nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	select top 1 AlertSeverity from tblSensorAlerts where SensorIdentifier=@sensorIdentifier order by EntryDate

	
	
	
			

END
GO