
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddCuttingMethodTemplate]
	(
	@CuttingMethodName	nvarchar(100),
	@Template nvarchar(max)
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Insert Into [dbo].[Cutting_Method_Template]
		([CuttingMethod],[Template])
		Select [ID],@Template From [dbo].[Cutting_Method] with (nolock)
			Where [Name]=@CuttingMethodName
END

