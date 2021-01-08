CREATE TABLE [dbo].[tbl_DocMovDet] (
    [idDocMovDet]      INT      IDENTITY (1, 1) NOT NULL,
    [idDocMov]         INT      NOT NULL,
    [idArticulo]       INT      NOT NULL,
    [Cantidad]         INT      NOT NULL,
    [TipoMov]          CHAR (1) NOT NULL,
    [Precio]           MONEY    NOT NULL,
    [Costo]            MONEY    NOT NULL,
    [IVA]              MONEY    NOT NULL,
    [FechaCreacion]    DATETIME NOT NULL,
    [AlteraExistencia] BIT      NOT NULL,
    CONSTRAINT [PK_tbl_DocMovDet] PRIMARY KEY CLUSTERED ([idDocMovDet] ASC)
);


GO
CREATE TRIGGER [dbo].[TR_CreateInvTran]

ON [dbo].[tbl_DocMovDet]

AFTER INSERT

AS 

BEGIN

-- SET NOCOUNT ON impide que se generen mensajes de texto 

-- con cada instrucción 

SET NOCOUNT ON;

 
DECLARE @AlteraInventario as bit

SELECT @AlteraInventario = AlteraExistencia FROM inserted

IF @AlteraInventario = 1
	INSERT INTO tbl_InventTran (idFacturaDetalle, idDocMov, TipoMov, idArticulo, Cantidad, Costo, Precio, IVA, FechaCreacion, AlteraCosto)
		(
			SELECT NULL, inserted.idDocMov, inserted.TipoMov, inserted.idArticulo, inserted.Cantidad, inserted.Costo, inserted.Precio, inserted.IVA, GETDATE(), 0
			FROM inserted
		)	
END