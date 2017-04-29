

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].spUpdateCuttingMethodTemplate
	(
	@CuttingMethod varchar(100),
	@Template nvarchar(max)
	)
AS
BEGIN
	--SET NOCOUNT ON;

	If Exists(Select '*' From Cutting_Method_Template Where CuttingMethod=@CuttingMethod)
		update [dbo].[Cutting_Method_Template] set Template=@Template Where CuttingMethod=@CuttingMethod
	Else
		Insert Into [dbo].[Cutting_Method_Template]
			([CuttingMethod],[Template])
			Values(@CuttingMethod,@Template) 
END


