CREATE TABLE [dbo].[tbl_CotizacionDet] (
    [idCotizacionDet] INT      IDENTITY (1, 1) NOT NULL,
    [idCotizacion]    INT      NOT NULL,
    [idArticulo]      INT      NOT NULL,
    [Cantidad]        INT      NOT NULL,
    [Precio]          MONEY    NOT NULL,
    [Costo]           MONEY    NOT NULL,
    [FechaCreacion]   DATETIME NOT NULL,
    CONSTRAINT [PK_tbl_CotizacionDet] PRIMARY KEY CLUSTERED ([idCotizacionDet] ASC)
);

