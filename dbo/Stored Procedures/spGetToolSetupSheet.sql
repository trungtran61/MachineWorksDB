-- spGetToolSetupSheet 1
CREATE proc [dbo].[spGetToolSetupSheet]
(
@SetupSheetID int
)
As
Begin
Set NoCount On

SELECT tss.* --, PartName, PartNumber 
FROM [ToolSetupSheet] tss
--left JOIN proWIP.dbo.[PartNumber] pn On pn.HID=tss.PartNumberID
 where ID = @SetupSheetID

SELECT ts.Id, ts.Sequence, ts.N, ts.ToolNumber, ts.TONumber, ts.Snippet,
	CuttingMethod=ts.CuttingMethod, ts.SpecialComment, 
	PartsPerCorner=IsNull(ts.PartsPerCorner,0), SecondsPerTool=IsNull(ts.SecondsPerTool,0),  
	ToolItemNumber=t.mwItemNumber, ToolName=t.mwName, ToolDesc=t.Description, ToolLocation=t.mwLocation,
	ToolID,ToolHolder1ID,ToolHolder2ID,ToolHolder3ID,ts.Comment,	
	ToolHolder1Item=th1.mwItemNumber, ToolHolder1MWID=th1.mwMWID, ToolHolder1Loc=th1.mwLocation, ToolHolder1Name = th1.mwName,
	ToolHolder2Item=th2.mwItemNumber, ToolHolder2MWID=th2.mwMWID, ToolHolder2Loc=th2.mwLocation, ToolHolder2Name = th2.mwName,
	ToolHolder3Item=th3.mwItemNumber, ToolHolder3MWID=th3.mwMWID, ToolHolder3Loc=th3.mwLocation, ToolHolder3Name = th3.mwName,
	ToolImage=ti.mwFolder+ ti.mwFileName,
	ToolHolder1Image=thi1.mwFolder+ thi1.mwFileName,
	ToolHolder2Image=thi2.mwFolder+ thi2.mwFileName,
	ToolHolder3Image=thi3.mwFolder+ thi3.mwFileName
FROM ToolSetup ts
	INNER JOIN ToolSetupSheet_ToolSetup tssts
		On tssts.ToolSetupSheet_ID=@SetupSheetID And tssts.ToolSetup_ID=ts.ID
	LEFT JOIN dbo.MWToolInventory t
		On t.mwHID=ts.ToolID
	LEFT JOIN dbo.MWToolInventory th1
		On th1.mwHID=ts.ToolHolder1ID	
	LEFT JOIN dbo.MWToolInventory th2
		On th2.mwHID=ts.ToolHolder2ID	
	LEFT JOIN dbo.MWToolInventory th3
		On th3.mwHID=ts.ToolHolder3ID	
	LEFT JOIN dbo.MWImage ti
		On ti.mwHID=ts.ToolID
	LEFT JOIN dbo.MWImage thi1
		On thi1.mwHID=ts.ToolHolder1ID
	LEFT JOIN dbo.MWImage thi2
		On thi2.mwHID=ts.ToolHolder2ID
	LEFT JOIN dbo.MWImage thi3
		On thi3.mwHID=ts.ToolHolder3ID
	--where ToolSetupSheetID = @SetupSheetID

	

End

