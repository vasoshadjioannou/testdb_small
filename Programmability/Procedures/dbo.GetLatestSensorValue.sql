﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetLatestSensorValue]
	-- Add the parameters for the stored procedure here
	@sensorId nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	select top 1 isnull(convert(float, SensorValue), '0')
	from tblSensorValues
	where SensorIdentifier=@sensorId
	order by EntryDate desc


END
GO