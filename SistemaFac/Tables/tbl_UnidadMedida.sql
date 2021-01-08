CREATE TABLE [dbo].[tbl_UnidadMedida] (
    [idUnidadMedida]   INT           IDENTITY (1, 1) NOT NULL,
    [UnidadMedida]     VARCHAR (200) NOT NULL,
    [UnidaddeServicio] BIT           NOT NULL,
    CONSTRAINT [PK_tbl_UnidadMedida] PRIMARY KEY CLUSTERED ([idUnidadMedida] ASC)
);

