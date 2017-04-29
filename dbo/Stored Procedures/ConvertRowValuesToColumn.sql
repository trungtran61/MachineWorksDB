/*
exec ConvertRowValuesToColumn
	@ColumnName='ColumnName'
	@TableName='MWToolInventoryColumns',
	@Criteria='where Searchable=1 Or [SelectedByDefault]=1'
*/
CREATE Proc ConvertRowValuesToColumn
(
@ColumnName	varchar(100),
@TableName	varchar(100),
@Criteria	varchar(max)
)
As
Begin

Declare @Sql varchar(max)
Set @Sql = 'Select Substring((Select distinct '', ''+ ' + @ColumnName + ' AS [text()] ' +
					'From ' + @TableName + ' (nolock) ' +
						@Criteria + ' For XML PATH ('''')),2, 1000000) JoinedString'
Print @Sql
Exec(@Sql)
End