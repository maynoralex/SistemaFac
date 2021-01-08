CREATE TABLE [dbo].[tbl_Modulo] (
    [idModulo]      INT           IDENTITY (1, 1) NOT NULL,
    [idModuloPadre] INT           NULL,
    [Modulo]        VARCHAR (200) NULL,
    CONSTRAINT [PK_tbl_Modulo] PRIMARY KEY CLUSTERED ([idModulo] ASC)
);

