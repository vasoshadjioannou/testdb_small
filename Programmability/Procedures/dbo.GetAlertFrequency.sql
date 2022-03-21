SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAlertFrequency] --'designstudio'
	-- Add the parameters for the stored procedure here
	@zoneName nvarchar(250),
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
	
	declare @result table(label nvarchar(250), value int)

	insert into @result values('00:00', 0);
	insert into @result values('01:00', 0);
	insert into @result values('02:00', 0);
	insert into @result values('03:00', 0);
	insert into @result values('04:00', 0);
	insert into @result values('05:00', 0);
	insert into @result values('06:00', 0);
	insert into @result values('07:00', 0);
	insert into @result values('08:00', 0);
	insert into @result values('09:00', 0);
	insert into @result values('10:00', 0);
	insert into @result values('11:00', 0);
	insert into @result values('12:00', 0);
	insert into @result values('13:00', 0);
	insert into @result values('14:00', 0);
	insert into @result values('15:00', 0);
	insert into @result values('16:00', 0);
	insert into @result values('17:00', 0);
	insert into @result values('18:00', 0);
	insert into @result values('19:00', 0);
	insert into @result values('20:00', 0);
	insert into @result values('21:00', 0);
	insert into @result values('22:00', 0);
	insert into @result values('23:00', 0);

	declare @todayAlertIds table(aid bigint)
	insert into @todayAlertIds
	select SensorAlertID from tblSensorAlerts 
	where AlertTimeDateTime >=@startDate
	and AlertTimeDateTime <= @endDate

	Declare @tempId int
	declare @alertHour int
	While (Select Count(*) From @todayAlertIds) > 0
	Begin
		Select Top 1 @tempId = aid From @todayAlertIds

			set @alertHour = (select datepart(hour, AlertTimeDateTime) from tblSensorAlerts where SensorAlertID=@tempId)
			
			update @result
			set value+=1
			where label=convert(nvarchar(10), @alertHour) + ':00'
			or label='0' + convert(nvarchar(10), @alertHour) + ':00'

		Delete @todayAlertIds Where aid = @tempId
	End
	
	select * from @result

END


GO