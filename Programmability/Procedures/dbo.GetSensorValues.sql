SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSensorValues] --'sensor1***sensor2***sensor3***sensor4', '2019', '09', '02', '00', '00', '2019', '09', '02', '00', '00'
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
	
	declare @sensors table(sidd bigint identity(1,1), sensorId nvarchar(250))
	insert into @sensors
	select * from fnSplitString(@sensorIdentifiersString, '***')

	declare @result table(SensorId nvarchar(250), [Type] nvarchar(250), LastHourAverageValue float, LatestValue float, historicValuesXml nvarchar(max))

	
	declare @sensorMetrics table(mid bigint identity(1,1), metric nvarchar(250))
	declare @sensorIdentifier nvarchar(250)
	declare @metric nvarchar(250)

	Declare @sensorPK int
	Declare @metricPK int
	While (Select Count(*) From @sensors) > 0
	Begin
		Select Top 1 @sensorPK = sidd From @sensors

			set @sensorIdentifier = (select sensorId from @sensors where sidd=@sensorPK)

			delete from @sensorMetrics
			insert into @sensorMetrics
			select distinct SensorMetric from tblSensorValues where SensorIdentifier=@sensorIdentifier
			and SensorMetric!='presence'
			and SensorMetric!='face'
			and SensorMetric!='id'

			While (Select Count(*) From @sensorMetrics) > 0
			Begin
				Select Top 1 @metricPK = mid From @sensorMetrics
					
					set @metric = (select metric from @sensorMetrics where mid=@metricPK)

					insert into @result
					values(
						@sensorIdentifier,
						@metric,
						0,
						0,
						''
					)

					update @result
					set LastHourAverageValue =	(
													select avg(convert(float,SensorValue))
													from tblSensorValues
													where SensorIdentifier=@sensorIdentifier
													and SensorMetric=@metric
													and TimestampDateTime>=dateadd(HH, -1, @endDate)
													and TimestampDateTime >= @startDate
													and TimestampDateTime <= @endDate
													and ISNUMERIC(SensorValue) = 1
												),
					LatestValue =	(
										select top 1 SensorValue
										from tblSensorValues
										where SensorIdentifier=@sensorIdentifier
										and SensorMetric=@metric
										and TimestampDateTime >= @startDate
										and TimestampDateTime <= @endDate
										and ISNUMERIC(SensorValue) = 1
										order by TimestampDateTime desc
									),
					historicValuesXml = (
											select top 100 SensorValue, [Timestamp]
											from tblSensorValues
											where SensorIdentifier=@sensorIdentifier
											and SensorMetric=@metric
											and TimestampDateTime >= @startDate
											and TimestampDateTime <= @endDate
											and ISNUMERIC(SensorValue) = 1
											order by TimestampDateTime desc
											for xml auto
										)
					where sensorId=@sensorIdentifier
					and Type=@metric

				Delete @sensorMetrics Where mid = @metricPK
			End

		Delete @sensors Where sidd = @sensorPK
	End

	select * from @result
END


GO