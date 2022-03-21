SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertOrUpdateSensorValue]
	-- Add the parameters for the stored procedure here
	@SensorIdentifier nvarchar(250),
	@Timestamp nvarchar(250),
	@PackageId nvarchar(250),
	@MetricName nvarchar(250),
	@MetricValue nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	if exists (select SensorValueID from tblSensorValues where SensorIdentifier=@SensorIdentifier and SensorMetric=@MetricName)
		begin
			update tblSensorValues
			set SensorValue=@MetricValue,
			[Timestamp]=@Timestamp,
			LastUpdated=getdate()
			where SensorIdentifier=@SensorIdentifier and SensorMetric=@MetricName
		end
	else
		begin
			insert into tblSensorValues
			values(
				getdate(),
				@SensorIdentifier,
				@MetricName,
				@MetricValue,
				@Timestamp,
				@PackageId,
				getdate(),
				getdate()
			)
		end
		select * from tblSensorValues

END
GO