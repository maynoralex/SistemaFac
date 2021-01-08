CREATE TABLE [dbo].[tbl_Articulo] (
    [idArticulo]        INT           IDENTITY (1, 1) NOT NULL,
    [Codigo]            VARCHAR (200) NOT NULL,
    [Descripcion]       VARCHAR (200) NOT NULL,
    [Existencia]        INT           NOT NULL,
    [idTipoArticulo]    INT           NOT NULL,
    [idMarca]           INT           NULL,
    [idLinea]           INT           NOT NULL,
    [idProveedor]       INT           NULL,
    [idUnidadMedida]    INT           NOT NULL,
    [Costo]             MONEY         NOT NULL,
    [Precio1]           MONEY         NOT NULL,
    [Precio2]           MONEY         NOT NULL,
    [Precio3]           MONEY         NOT NULL,
    [Precio4]           MONEY         NOT NULL,
    [Estado]            BIT           CONSTRAINT [DF_tbl_Articulo_Estado] DEFAULT ((1)) NOT NULL,
    [FechaCreacion]     DATETIME      NOT NULL,
    [FechaModificacion] DATETIME      NOT NULL,
    [FechaUltimaCompra] DATETIME      NULL,
    [FechaUltimaVenta]  DATETIME      NULL,
    [BarCode]           VARCHAR (100) NULL,
    CONSTRAINT [PK_tbl_Articulo] PRIMARY KEY CLUSTERED ([idArticulo] ASC),
    CONSTRAINT [FK_tbl_Articulo_tbl_Linea] FOREIGN KEY ([idLinea]) REFERENCES [dbo].[tbl_Linea] ([idLinea]),
    CONSTRAINT [FK_tbl_Articulo_tbl_Marca] FOREIGN KEY ([idMarca]) REFERENCES [dbo].[tbl_Marca] ([idMarca]),
    CONSTRAINT [FK_tbl_Articulo_tbl_Proveedor] FOREIGN KEY ([idProveedor]) REFERENCES [dbo].[tbl_Proveedor] ([idProveedor]),
    CONSTRAINT [FK_tbl_Articulo_tbl_TipoArticulo] FOREIGN KEY ([idTipoArticulo]) REFERENCES [dbo].[tbl_TipoArticulo] ([idTipoArticulo]),
    CONSTRAINT [FK_tbl_Articulo_tbl_UnidadMedida] FOREIGN KEY ([idUnidadMedida]) REFERENCES [dbo].[tbl_UnidadMedida] ([idUnidadMedida])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tbl_Articulo]
    ON [dbo].[tbl_Articulo]([Codigo] ASC);

