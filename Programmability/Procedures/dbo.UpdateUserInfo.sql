SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUserInfo]
	-- Add the parameters for the stored procedure here
	@userId nvarchar(250),
	@privateKey nvarchar(250),
	@publicKey nvarchar(250),
	@privileges nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	if exists (select UserKeysID from tblUserInfo where UserId=@userId)
		begin
			update tblUserInfo
			set PrivateKey=@privateKey,
			PublicKey=@publicKey,
			privileges = @privileges,
			LastUpdated=getdate()
			where UserId=@userId
		end
	else
		begin
			insert into tblUserInfo
			values(
				getdate(),
				@userId,
				@privateKey,
				@publicKey,
				@privileges,
				0,
				getdate()
			)
		end

END
GO