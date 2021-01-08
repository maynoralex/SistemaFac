
CREATE PROCEDURE [dbo].[sp_GetArticulo] 
	@UserId uniqueidentifier,
	@Function int,
	@idArticulo int
	
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @ShowAllInfo bit
	EXECUTE @ShowAllInfo = sp_CheckPermission @UserId, @Function
	
	IF @ShowAllInfo = 1 
	BEGIN
		SELECT A.idArticulo, A.BarCode, A.Codigo, A.Descripcion, T.TipoArticulo, M.Marca, L.Linea, P.Proveedor, A.Existencia, U.UnidadMedida, A.Costo, A.Precio1, A.Precio2, A.Precio3, A.Precio4, A.Estado, A.FechaCreacion, A.FechaModificacion, A.FechaUltimaCompra, A.FechaUltimaVenta, A.idProveedor, A.idLinea, A.idMarca, A.idTipoArticulo, A.idUnidadMedida
		FROM tbl_Articulo A INNER JOIN tbl_TipoArticulo T ON T.idTipoArticulo = A.idTipoArticulo
		LEFT JOIN tbl_Marca M ON A.idMarca = M.idMarca
		INNER JOIN tbl_Linea L ON A.idLinea = L.idLinea
		LEFT JOIN tbl_Proveedor P ON A.idProveedor = P.idProveedor
		INNER JOIN  tbl_UnidadMedida U ON A.idUnidadMedida = U.idUnidadMedida
		WHERE A.idArticulo = @idArticulo
	END	
	ELSE
	BEGIN
		SELECT A.idArticulo, A.BarCode, A.Codigo, A.Descripcion, T.TipoArticulo, M.Marca, L.Linea, P.Proveedor, A.Existencia, U.UnidadMedida, CAST(0 as money) 'Costo', A.Precio1, A.Precio2, A.Precio3, A.Precio4, A.Estado, A.FechaCreacion, A.FechaModificacion, A.FechaUltimaCompra, A.FechaUltimaVenta, A.idProveedor, A.idLinea, A.idMarca, A.idTipoArticulo, A.idUnidadMedida
		FROM tbl_Articulo A INNER JOIN tbl_TipoArticulo T ON T.idTipoArticulo = A.idTipoArticulo
		LEFT JOIN tbl_Marca M ON A.idMarca = M.idMarca
		INNER JOIN tbl_Linea L ON A.idLinea = L.idLinea
		LEFT JOIN tbl_Proveedor P ON A.idProveedor = P.idProveedor
		INNER JOIN  tbl_UnidadMedida U ON A.idUnidadMedida = U.idUnidadMedida
		WHERE A.idArticulo = @idArticulo
	END
	
END