SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[RoomMonitoringExportToXml] --'sensor5*'
	@sensorsString nvarchar(max)
AS
BEGIN
	
	declare @sensors table(sensorName nvarchar(250))
	insert into @sensors
	select * from fnSplitString(@sensorsString, '*')

	declare @xml nvarchar(max)=''
	
	set @xml += (select * from tblSensorValues where SensorIdentifier in (select * from @sensors) for xml auto)
	set @xml += (select * from tblSensorAlerts where SensorIdentifier in (select * from @sensors) for xml auto)
	
	select isnull(@xml,'')

END
GO