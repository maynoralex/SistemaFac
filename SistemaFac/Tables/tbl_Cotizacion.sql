CREATE TABLE [dbo].[tbl_Cotizacion] (
    [idCotizacion]    INT              IDENTITY (1, 1) NOT NULL,
    [Serie]           VARCHAR (50)     NOT NULL,
    [NumDoc]          BIGINT           NOT NULL,
    [Fecha]           DATETIME         NOT NULL,
    [idClient]        INT              NULL,
    [Nombre]          VARCHAR (200)    NOT NULL,
    [Direccion]       VARCHAR (200)    NOT NULL,
    [NIT]             VARCHAR (200)    NOT NULL,
    [TotalCotizacion] DECIMAL (18, 2)  NOT NULL,
    [Observaciones]   TEXT             NULL,
    [UserId]          UNIQUEIDENTIFIER NOT NULL,
    [FechaCreado]     DATETIME         NOT NULL,
    [FechaModificado] DATETIME         NOT NULL,
    [ModificadoPor]   UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_tbl_Cotizacion] PRIMARY KEY CLUSTERED ([idCotizacion] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_tbl_Cotizacion]
    ON [dbo].[tbl_Cotizacion]([Serie] ASC, [NumDoc] ASC);

