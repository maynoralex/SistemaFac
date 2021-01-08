CREATE TABLE [dbo].[tbl_Cliente] (
    [idCliente]         INT           IDENTITY (1, 1) NOT NULL,
    [Codigo]            VARCHAR (200) NULL,
    [NIT]               VARCHAR (200) NULL,
    [Cliente]           VARCHAR (200) NOT NULL,
    [RazonSocial]       VARCHAR (200) NOT NULL,
    [Clasificacion]     VARCHAR (200) NULL,
    [Direccion]         VARCHAR (200) NULL,
    [Atencion]          VARCHAR (200) NULL,
    [Tel1]              VARCHAR (50)  NULL,
    [Tel2]              VARCHAR (50)  NULL,
    [Tel3]              VARCHAR (50)  NULL,
    [Fax]               VARCHAR (50)  NULL,
    [Email]             VARCHAR (200) NULL,
    [CreditoAutorizado] BIT           NOT NULL,
    [DiasCredito]       INT           NOT NULL,
    [LimiteCredito]     MONEY         NOT NULL,
    [Observaciones]     TEXT          NULL,
    [Estado]            BIT           NOT NULL,
    [FechaCreacion]     DATETIME      NOT NULL,
    [FechaModificacion] DATETIME      NOT NULL,
    CONSTRAINT [PK_tbl_Cliente] PRIMARY KEY CLUSTERED ([idCliente] ASC)
);

