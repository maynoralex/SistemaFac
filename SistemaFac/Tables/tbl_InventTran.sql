CREATE TABLE [dbo].[tbl_InventTran] (
    [idInventTran]     INT      IDENTITY (1, 1) NOT NULL,
    [idFacturaDetalle] INT      NULL,
    [idDocMov]         INT      NULL,
    [TipoMov]          CHAR (1) NOT NULL,
    [idArticulo]       INT      NOT NULL,
    [Cantidad]         INT      NOT NULL,
    [Costo]            MONEY    NOT NULL,
    [Precio]           MONEY    NOT NULL,
    [IVA]              MONEY    NULL,
    [FechaCreacion]    DATETIME NOT NULL,
    [AlteraCosto]      BIT      NOT NULL,
    CONSTRAINT [PK_tbl_InventTran] PRIMARY KEY CLUSTERED ([idInventTran] ASC)
);


GO
CREATE TRIGGER TR_UpdateExistencia

ON dbo.tbl_InventTran

AFTER INSERT

AS 

BEGIN

-- SET NOCOUNT ON impide que se generen mensajes de texto 

-- con cada instrucción 

SET NOCOUNT ON;

 
DECLARE @Valor INT
DECLARE @idArticulo INT
DECLARE @AlteraCosto BIT
DECLARE @Costo money

SELECT @Valor = CASE WHEN inserted.TipoMov = 'E' THEN 1 * inserted.Cantidad WHEN TipoMov = 'S' THEN -1 * inserted.Cantidad END, 
	@idArticulo = inserted.idArticulo, 
	@AlteraCosto = inserted.AlteraCosto,
	@Costo = inserted.Costo	
FROM inserted

IF @Valor <> 0
	UPDATE tbl_Articulo SET Existencia = Existencia + @Valor WHERE idArticulo = @idArticulo	
IF @AlteraCosto = 1
	UPDATE tbl_Articulo SET Costo = @Costo WHERE idArticulo = @idArticulo
	
END
