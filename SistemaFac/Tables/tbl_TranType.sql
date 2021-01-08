CREATE TABLE [dbo].[tbl_TranType] (
    [idTranType]  INT           IDENTITY (1, 1) NOT NULL,
    [Descripcion] VARCHAR (200) NOT NULL,
    [TipoMov]     CHAR (1)      NOT NULL,
    CONSTRAINT [PK_tbl_TranType] PRIMARY KEY CLUSTERED ([idTranType] ASC)
);

