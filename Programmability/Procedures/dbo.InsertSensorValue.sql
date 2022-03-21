SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InsertSensorValue]
	-- Add the parameters for the stored procedure here
	@SensorIdentifier nvarchar(250),
	@Timestamp nvarchar(250),
	@PackageId nvarchar(250),
	@MetricName nvarchar(250),
	@MetricValue nvarchar(250),
	@year nvarchar(250),
	@month nvarchar(250),
	@day nvarchar(250),
	@hour nvarchar(250),
	@min nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	insert into tblSensorValues
	values(
		getdate(),
		@SensorIdentifier,
		@MetricName,
		@MetricValue,
		(
		
		select 
			convert(nvarchar(10), DATEPART(year, getdate())) + '-' +
			convert(nvarchar(10),DATEPART(month, getdate())) + '-' +
			convert(nvarchar(10),DATEPART(day, getdate())) + 'T' +
			convert(nvarchar(10),DATEPART(hour, getdate())) + ':' +
			convert(nvarchar(10),DATEPART(minute, getdate())) + ':' +
			convert(nvarchar(10),DATEPART(second, getdate())) + '.' +
			convert(nvarchar(10),DATEPART(millisecond, getdate()))                              
		),
		@PackageId,
		getdate(),
		DATETIMEFROMPARTS(@year, @month, @day, @hour, @min, 0, 0)
	)


END
GO