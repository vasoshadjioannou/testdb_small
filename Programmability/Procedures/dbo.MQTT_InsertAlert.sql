SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MQTT_InsertAlert] 
	-- Add the parameters for the stored procedure here
	@AlertName nvarchar(250), 
	@SensorId nvarchar(250),
	@AlertMessage nvarchar(2000),
	@Severity nvarchar(250),
	@Timestamp nvarchar(250),
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
	
	insert into tblSensorAlerts
	values(
		getdate(),
		null,
		@Timestamp,
		null,
		@AlertMessage,
		@AlertMessage,
		@SensorId,
		@Severity,
		getdate(),
		0,
		DATETIMEFROMPARTS(@year, @month, @day, @hour, @min, 0, 0)
	)

END
GO