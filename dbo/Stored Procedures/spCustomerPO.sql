CREATE procedure [dbo].[spCustomerPO] (@CPO nvarchar(50)) AS
BEGIN
 IF NOT EXISTS(SELECT mwHID FROM MWCustomerPO WHERE mwCustomerPO=@CPO)
  INSERT INTO MWCustomerPO (mwCustomerPO) VALUES (@CPO)
END

