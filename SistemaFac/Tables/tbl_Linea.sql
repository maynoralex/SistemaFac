CREATE TABLE [dbo].[tbl_Linea] (
    [idLinea] INT           IDENTITY (1, 1) NOT NULL,
    [Linea]   VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_tbl_Linea] PRIMARY KEY CLUSTERED ([idLinea] ASC)
);

