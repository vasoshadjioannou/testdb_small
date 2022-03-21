SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RetrieveSubscribedSensorsOfUser]
	-- Add the parameters for the stored procedure here
	@userId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	select sens.SensorID, sens.SensorIdentifier
	from tblSubscibersToSensors s2s
	inner join tblSubscribers s on s.SubscriberID=s2s.Subscriber_ID
	inner join tblSensors sens on sens.SensorIdentifier=s2s.SensorIdentifier
	where s.[User_ID]=@userId


	

END
GO