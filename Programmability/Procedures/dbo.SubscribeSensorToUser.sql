SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SubscribeSensorToUser]
	-- Add the parameters for the stored procedure here
	@subscriberId bigint, @sensorIdentifier nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into tblSubscibersToSensors
	values(
		getdate(),
		@subscriberId,
		@sensorIdentifier,
		getdate()
	)

END
GO