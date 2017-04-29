-- uwgweb_commerce..sp_findsp '.items'
create PROCEDURE [dbo].[sp_findsp] @s varchar(255) as
DECLARE @msg varchar(255) ,@ul varchar(255)
select @s='%' + @s + '%'
select 'SP Name'=upper(o.name), Seq=colid ,'SP 
Line'=substring(text,patindex(@s,text)-5, 30)
from syscomments c , sysobjects o
where o.id=c.id
and patindex(@s,text) > 0
order by name
SELECT @msg='* Stored procedures containing string "' + @s + '=' + 
convert(varchar(8),@@rowcount) + ' *'
SELECT @ul=replicate('*',datalength(@msg))
Print ' '
PRINT @ul
PRINT @msg
Print @ul
