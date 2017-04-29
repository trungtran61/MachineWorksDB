-- spGetImageByCodeId 3948
Create Proc spGetImageByCodeId
(
@codeid int
)
As
Begin

Set NoCount On
select * from MWImage where mwcodeid=@codeid

End