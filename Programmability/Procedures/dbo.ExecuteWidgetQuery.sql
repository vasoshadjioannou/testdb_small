SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
create PROCEDURE [dbo].[ExecuteWidgetQuery] --'graphTable482',20149,'',482,'10','WiseBOSERPDB_DEV_WEB.dbo.getWebDashboardAML_OverallDueDeligenceGraph N''44'''
	-- Add the parameters for the stored procedure here
	@widgetIdentifier nvarchar(200), 
	@dashboardIdentifier bigint, 
	@searchParameters nvarchar(max),
	@widgetDefinitionId bigint,
	@numberOfResults nvarchar(20),
	@query nvarchar(max)
AS
BEGIN
	if @numberOfResults = '0'
		set @numberOfResults='top 10 * '
	else if @numberOfResults='ALL'
		set @numberOfResults='*'
	else set @numberOfResults='top ' + @numberOfResults + ' * '

	if @query like '%**NO_OF_RESULTS**%'
		begin
			set @query = (SELECT REPLACE(@query,'top **NO_OF_RESULTS**',@numberOfResults))
			set @query = (SELECT REPLACE(@query,'**WIDGET_IDENTIFIER**',@widgetIdentifier))
			set @query += ';select ' + @numberOfResults + ' from #tempTable' + @widgetIdentifier + ' ' + @searchParameters + ' for xml auto; drop TABLE #tempTable' + @widgetIdentifier
			execute(@query)

		end
	else
		begin
			declare @storedProcedureName nvarchar(400) = (select top 1 * from dbo.fnSplitString(@query,''))
			
			declare @spFields table(primId bigint not null identity(1,1) primary key, outputName nvarchar(500), outputType nvarchar(100))
			insert into @spFields
			SELECT name, system_type_name FROM sys.dm_exec_describe_first_result_set(N'EXEC ' + @storedProcedureName, null, 0)
			
			declare @tempQuery nvarchar(max) = 'declare @result table(';
			Declare @tempId int
			declare @isFirst bit=1
			While (Select Count(*) From @spFields) > 0
			Begin
				Select Top 1 @tempId = primId From @spFields
					if @isFirst=1
						begin
							set @tempQuery += '[' + (select outputName from @spFields where primId=@tempId) + '] '
							set @tempQuery += (select outputType from @spFields where primId=@tempId)
							set @isFirst=0
						end
					else
						begin
							set @tempQuery += ', [' + (select outputName from @spFields where primId=@tempId) + '] '
							set @tempQuery += (select outputType from @spFields where primId=@tempId)
						end
				Delete @spFields Where primId = @tempId
			End
			set @tempQuery+=');'
			
			if @searchParameters=''
				set @tempQuery += ' insert into @result exec ' + @query+' ; select * from @result for xml auto'
			else
				begin
					set @searchParameters = (select ', ' where @query like '%,%') + @searchParameters

					set @tempQuery += ' insert into @result exec ' + @query+' '+@searchParameters + '; select * from @result for xml auto'
					--set @tempQuery += ' insert into @result exec ' + @query+' N'''+@searchParameters + '''; select * from @result for xml auto'
				end
			    
			
			print @tempQuery

			execute(@tempQuery)
		end


END

GO