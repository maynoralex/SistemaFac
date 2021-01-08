CREATE TABLE [dbo].[tbl_FacturaVentaDet] (
    [idFacturaVentaDet] INT      IDENTITY (1, 1) NOT NULL,
    [idFacturaVenta]    INT      NOT NULL,
    [idArticulo]        INT      NOT NULL,
    [Cantidad]          INT      NOT NULL,
    [TipoMov]           CHAR (1) NOT NULL,
    [Precio]            MONEY    NOT NULL,
    [Costo]             MONEY    NOT NULL,
    [IVA]               MONEY    NOT NULL,
    [FechaCreacion]     DATETIME NOT NULL,
    [AlteraExistencia]  BIT      NOT NULL,
    CONSTRAINT [PK_tbl_Facturacion] PRIMARY KEY CLUSTERED ([idFacturaVentaDet] ASC)
);


GO
CREATE TRIGGER [dbo].[TR_CreateInvTranFact]

ON [dbo].[tbl_FacturaVentaDet]

AFTER INSERT

AS 

BEGIN

-- SET NOCOUNT ON impide que se generen mensajes de texto 

-- con cada instrucción 

SET NOCOUNT ON;

 
DECLARE @AlteraInventario as bit
DECLARE @Costo as decimal(18,2)
DECLARE @idArticulo as int
DECLARE @Cantidad as int
DECLARE @idFacturaVentaDet as int
SELECT @idArticulo = inserted.idArticulo FROM inserted
SELECT @Cantidad = Cantidad FROM inserted
SELECT @AlteraInventario = AlteraExistencia FROM inserted
SELECT @Costo = Costo FROM tbl_Articulo WHERE idArticulo = @idArticulo
SELECT @idFacturaVentaDet = idFacturaVenta FROM inserted


IF @AlteraInventario = 1
BEGIN
	UPDATE tbl_FacturaVentaDet SET Costo = @Costo * @Cantidad WHERE idFacturaVentaDet = @idFacturaVentaDet
	INSERT INTO tbl_InventTran (idFacturaDetalle, idDocMov, TipoMov, idArticulo, Cantidad, Costo, Precio, IVA, FechaCreacion, AlteraCosto)
		(
			SELECT inserted.idFacturaVenta, NULL, inserted.TipoMov, inserted.idArticulo, inserted.Cantidad, inserted.Costo, inserted.Precio, inserted.IVA, GETDATE(), 0
			FROM inserted				
		)
		
END
END
