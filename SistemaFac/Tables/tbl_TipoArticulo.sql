CREATE TABLE [dbo].[tbl_TipoArticulo] (
    [idTipoArticulo] INT           IDENTITY (1, 1) NOT NULL,
    [TipoArticulo]   VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_tbl_TipoArticulo] PRIMARY KEY CLUSTERED ([idTipoArticulo] ASC)
);

