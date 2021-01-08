CREATE TABLE [dbo].[tbl_FacturaVenta] (
    [idFacturaVenta]  INT              IDENTITY (1, 1) NOT NULL,
    [Serie]           VARCHAR (50)     NOT NULL,
    [NumDoc]          BIGINT           NOT NULL,
    [Fecha]           DATETIME         NOT NULL,
    [Credito]         BIT              CONSTRAINT [DF_tbl_FacturaVenta_Credito] DEFAULT ((0)) NOT NULL,
    [DiasCredito]     INT              NOT NULL,
    [TipoCambio]      DECIMAL (18, 2)  NOT NULL,
    [idDocMov]        INT              NULL,
    [idClient]        INT              NULL,
    [Nombre]          VARCHAR (200)    NOT NULL,
    [Direccion]       VARCHAR (200)    NOT NULL,
    [NIT]             VARCHAR (200)    NOT NULL,
    [TotalFactura]    DECIMAL (18, 2)  NOT NULL,
    [Observaciones]   TEXT             NULL,
    [Anulado]         BIT              CONSTRAINT [DF_tbl_FacturaVenta_Anulado] DEFAULT ((0)) NOT NULL,
    [UserId]          UNIQUEIDENTIFIER NOT NULL,
    [FechaCreado]     DATETIME         NOT NULL,
    [FechaModificado] DATETIME         NOT NULL,
    [ModificadoPor]   UNIQUEIDENTIFIER NOT NULL,
    [Estado]          TINYINT          NOT NULL,
    CONSTRAINT [PK_tbl_FacturaVenta] PRIMARY KEY CLUSTERED ([idFacturaVenta] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tbl_FacturaVenta]
    ON [dbo].[tbl_FacturaVenta]([Serie] ASC, [NumDoc] ASC);


GO
CREATE TRIGGER [dbo].[TR_UpdateDocMov]

ON [dbo].[tbl_FacturaVenta]

AFTER INSERT

AS 

BEGIN

-- SET NOCOUNT ON impide que se generen mensajes de texto 

-- con cada instrucción 

SET NOCOUNT ON;

 
DECLARE @IdFacturaVenta as int
DECLARE @IdDocMov as int
SELECT @IdFacturaVenta = idFacturaVenta FROM inserted
SELECT @IdDocMov = idDocMov FROM inserted

IF @IdDocMov IS NOT NULL
	UPDATE tbl_DocMov SET idFacturaVenta = @IdFacturaVenta WHERE idDocMov = @IdDocMov
	
END