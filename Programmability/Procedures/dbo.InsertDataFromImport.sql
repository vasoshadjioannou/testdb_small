SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
create PROCEDURE [dbo].[InsertDataFromImport]
	-- Add the parameters for the stored procedure here
	@TableName nvarchar(500), 
	@Columns nvarchar(max),
	@ColumnsData nvarchar(max),
	@WhereClause nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @columnsOfTable table(columnName nvarchar(250))
	insert into @columnsOfTable
	SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName

	declare @entryDate nvarchar(250)=''
	declare @entryDateValue nvarchar(250)=''
	if exists (select columnName from @columnsOfTable where columnName='EntryDate')
		begin
			set @entryDate=', [EntryDate]'
			set @entryDateValue=', getdate()'
		end

	declare @lastUpdated nvarchar(250)=''
	declare @lastUpdatedValue nvarchar(250)=''
	if exists (select columnName from @columnsOfTable where columnName='LastUpdated')
		begin
			set @lastUpdated=', [LastUpdated]'
			set @lastUpdatedValue=', getdate()'
		end

    declare @queryToExecute nvarchar(max) = 
	'if not exists (select * from ' + @TableName + ' WHERE 1=1 ' + @whereClause + ') ' +
		'begin ' + 
			'insert into ' + @TableName + '(' + @Columns + @entryDate + @lastUpdated + ')' +
			' values(' + @columnsData + @entryDateValue + @lastUpdatedValue + ') ' +
		'end '

	execute(@queryToExecute)

	
	
END
GO