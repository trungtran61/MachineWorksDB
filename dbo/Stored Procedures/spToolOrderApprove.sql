CREATE PROCEDURE [dbo].[spToolOrderApprove](@HID int, @OrdApp smallint) AS
BEGIN
 UPDATE dbo.MWToolInventory SET OrderApproved=@OrdApp,NewAppDate=CASE WHEN @OrdApp IN (2,3) THEN getdate() ELSE NULL END WHERE mwHID=@HID;
END

