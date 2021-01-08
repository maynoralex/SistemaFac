CREATE TABLE [dbo].[tbl_AppConfig] (
    [ApplicationId]       UNIQUEIDENTIFIER NOT NULL,
    [PorcentajeIVA]       DECIMAL (18, 2)  NULL,
    [FacturaFormato]      VARCHAR (200)    NULL,
    [OrdenCompraFormato]  VARCHAR (200)    NULL,
    [OrdenEntregaFormato] VARCHAR (200)    NULL,
    [TipoCambio]          DECIMAL (18, 2)  NOT NULL,
    [SMTPServer]          VARCHAR (200)    NOT NULL,
    [MonedaAlt]           VARCHAR (200)    NOT NULL,
    [SimboloMoneda]       VARCHAR (10)     NOT NULL
);

