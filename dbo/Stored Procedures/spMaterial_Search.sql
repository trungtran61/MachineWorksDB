CREATE PROCEDURE [dbo].[spMaterial_Search](
@WorkOrder varchar(50) = NULL,
@PN varchar(50) = NULL,
@CustomerName varchar(50) = NULL,
@VendorName varchar(50) = NULL,
@Type varchar(50) = NULL,
@Size varchar(50) = NULL,
@Unit varchar(50) = NULL,
@Location varchar(50) = NULL,
@Ams varchar(50) = NULL,
@HeatLot varchar(50) = NULL,
@Qty varchar(5) = NULL,
@Cert varchar(5) = NULL
) AS
BEGIN
 SELECT * FROM dbo.vwMaterial WHERE 0=0
 AND (@WorkOrder IS NULL OR mwWorkOrder LIKE @WorkOrder)
 AND (@PN IS NULL OR mwPartNumber LIKE @PN)
 AND (@CustomerName IS NULL OR mwCustomerName LIKE @CustomerName)
 AND (@VendorName IS NULL OR mwVendorName LIKE @VendorName)
 AND (@Type IS NULL OR mwType LIKE @Type)
 AND (@Size IS NULL OR mwSize LIKE @Size)
 AND (@Unit IS NULL OR mwUnit LIKE @Unit)
 AND (@Location IS NULL OR mwLocation LIKE @Location)
 AND (@Ams IS NULL OR mwAms LIKE @Ams)
 AND (@HeatLot IS NULL OR mwHeatLot LIKE @HeatLot)
 AND (@Qty IS NULL OR @Qty='Both' OR (@Qty='Yes' AND mwQty > 0) OR (@Qty='No' AND mwQty < 1))
 AND (@Cert IS NULL OR @Cert='Both' OR mwCert=@Cert);
END
