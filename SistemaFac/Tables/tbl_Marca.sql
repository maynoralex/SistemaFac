CREATE TABLE [dbo].[tbl_Marca] (
    [idMarca] INT           IDENTITY (1, 1) NOT NULL,
    [Marca]   VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_tbl_Marca] PRIMARY KEY CLUSTERED ([idMarca] ASC)
);

