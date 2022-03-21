SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
create PROCEDURE [dbo].[InsertOrUpdateList]
	-- Add the parameters for the stored procedure here
	@ListName nvarchar(500), @FileName nvarchar(4000), @ListSize bigint
AS
BEGIN
	
	declare @listId bigint=0
	declare @latestListVersion bigint=1
	if exists (select listID from tblLists where [List Name] = @ListName)
		begin
			set @listId = (select listID from tblLists where [List Name] = @ListName)

			update tblLists
			set [Last Updated]=getdate()
			where listID=@listId

			set @latestListVersion = (select top 1 [Version No] from tblListVersion where List_Id=@listId order by [Version No] desc)

			insert into tblListVersion (	[Entry Date],
											[Version No],
											List_Id,
											[Filename],
											[Date],
											[Last Updated],
											ListSize)
			values(
				getdate(),
				(@latestListVersion+1),
				@listId,
				@FileName,
				null,
				getdate(),
				@ListSize
			)

		end
	else
		begin
			
			insert into tblLists (	[Entry Date],
									[List Name],
									[List Url],
									HasRssFeed,
									HasProcessed,
									[Last Processed Date],
									Abbreviation,
									Country_ID,
									ListType_ID,
									[Description],
									[List Source],
									NoOfRecords,
									[Last Updated],
									Cache)
			values(
				getdate(),
				@ListName,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				getdate(),
				null
			)
			set @listId=scope_identity()

			insert into tblListVersion(	[Entry Date],
										[Version No],
										List_Id,
										[Filename],
										[Date],
										[Last Updated],
										ListSize)
			values(
				getdate(),
				1,
				@listId,
				@FileName,
				null,
				getdate(),
				@ListSize
			)
		end

	select @listId as ListId
	
END
GO