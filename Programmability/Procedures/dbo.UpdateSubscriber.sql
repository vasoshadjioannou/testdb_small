SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSubscriber]
	-- Add the parameters for the stored procedure here
	@userId bigint, @userName nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		
	declare @subscriberId bigint = 0

	if not exists (select SubscriberID from tblSubscribers where [User_ID]=@userId)
		begin
			insert into tblSubscribers
			values(
				getdate(),
				@userId,
				@userName,
				getdate()
			)

			set @subscriberId = SCOPE_IDENTITY()
		end
	else
		begin
			set @subscriberId = (select SubscriberID from tblSubscribers where [User_ID]=@userId)
			update tblSubscribers set LastUpdated=getdate() where SubscriberID=@subscriberId

			delete from tblSubscibersToSensors where Subscriber_ID=@subscriberId
		end

	select @subscriberId

END
GO