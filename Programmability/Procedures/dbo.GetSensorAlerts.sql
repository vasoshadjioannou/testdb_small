SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSensorAlerts]
	-- Add the parameters for the stored procedure here
	@sensorIdentifiersString nvarchar(max),
	@startYear nvarchar(10),
	@startMonth nvarchar(10),
	@startDay nvarchar(10),
	@startHour nvarchar(10),
	@startMinute nvarchar(10),
	@endYear nvarchar(10),
	@endMonth nvarchar(10),
	@endDay nvarchar(10),
	@endHour nvarchar(10),
	@endMinute nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	declare @startDate datetime = DATETIMEFROMPARTS (@startYear, @startMonth, @startDay, @startHour, @startMinute, '0', '0')
	declare @endDate datetime = DATETIMEFROMPARTS (@endYear, @endMonth, @endDay, @endHour, @endMinute, '0', '0')

	declare @sensors table(sensorId nvarchar(250))
	insert into @sensors
	select * from fnSplitString(@sensorIdentifiersString, '***')

	update tblSensorAlerts set Seen=1

	select top 50	AlertTime as [time],
					AlertIdentifier as id,
					AlertMessage as [message],
					AlertName as name,
					SensorIdentifier as sensor_id,
					AlertSeverity as severity
	from tblSensorAlerts
	where SensorIdentifier in (select sensorId from @sensors)
	and AlertTimeDateTime >= @startDate
	and AlertTimeDateTime <= @endDate
	order by EntryDate desc

END
GO