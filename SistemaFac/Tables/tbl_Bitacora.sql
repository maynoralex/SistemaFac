CREATE TABLE [dbo].[tbl_Bitacora] (
    [idBitacora]    INT      IDENTITY (1, 1) NOT NULL,
    [idTipoTran]    INT      NOT NULL,
    [idUsuario]     INT      NOT NULL,
    [QueryText]     TEXT     NULL,
    [FechaCreacion] DATETIME NOT NULL,
    CONSTRAINT [PK_tbl_Bitacora] PRIMARY KEY CLUSTERED ([idBitacora] ASC)
);

