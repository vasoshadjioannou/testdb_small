SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddNewSensor]
	-- Add the parameters for the stored procedure here
	
	@newSensorName nvarchar(250),
	@newSensorZone nvarchar(250),
	@newSensorGateway nvarchar(250),
	@newSensorType nvarchar(250),
	@newSensorIcon nvarchar(250),
	@newSensorLocX nvarchar(250),
	@newSensorLocY nvarchar(250),
	@newSensorPublicKey nvarchar(250),
	@newSensorPrivateKey nvarchar(250)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @TEST bigint=1
	declare @TEST2 bigint=1111

    -- Insert statements for procedure here
	
	insert into tblSensors
	values(
		getdate(),
		@newSensorZone,
		@newSensorGateway,
		@newSensorName,
		getdate()
	)

	insert into tblSensorDetails
	values(
		getdate(),
		@newSensorZone,
		@newSensorGateway,
		@newSensorName,
		@newSensorType,
		@newSensorIcon,
		@newSensorLocX,
		@newSensorLocY,
		getdate()
	)

	insert into tblSensorInfo
	values(
		getdate(),
		@newSensorName,
		@newSensorPublicKey,
		@newSensorPrivateKey,
		getdate()
	)

END
GO