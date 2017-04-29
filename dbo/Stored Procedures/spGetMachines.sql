-- spGetMachines ''
CREATE Proc [dbo].[spGetMachines]
(
@MachinePrefix	char(1)=''
)
As
Begin

If @MachinePrefix = ''
	SELECT m1.* FROM [proWIP].[dbo].[Machine] m1 (nolock)
	  INNER JOIN (Select MachineId=Left(MachineID,1) From [proWIP].[dbo].[Machine] (nolock) Group By Left(MachineID,1) Having count(*) > 1) m2
	  ON Left(m1.MachineID,1)=m2.MachineID
	  Where SUBSTRING(m1.MachineID,2,2)='01'
Else
	SELECT * FROM [proWIP].[dbo].[Machine] (nolock)
	  Where SUBSTRING([MachineID],2,2)<>'01' and ISNUMERIC(SUBSTRING([MachineID],2,2))=1
		And SUBSTRING([MachineID],1,1)=@MachinePrefix
 
End