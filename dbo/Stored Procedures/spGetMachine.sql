-- spGetMachine 
create Proc [dbo].[spGetMachine]
(
@MachineID	varchar(5)=null
)
As
Begin

	SELECT * FROM [proWIP].[dbo].[Machine] (nolock)
	  Where @MachineID is null
		Or MachineID=@MachineID
 
End