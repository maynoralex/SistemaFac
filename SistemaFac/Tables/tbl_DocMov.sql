CREATE TABLE [dbo].[tbl_DocMov] (
    [idDocMov]       INT              IDENTITY (1, 1) NOT NULL,
    [idTranType]     INT              NOT NULL,
    [Serie]          VARCHAR (50)     NOT NULL,
    [NumDoc]         BIGINT           NOT NULL,
    [Fecha]          DATETIME         NOT NULL,
    [idClientProv]   INT              NULL,
    [Client]         BIT              NOT NULL,
    [idFacturaVenta] INT              NULL,
    [Descripcion]    VARCHAR (200)    NULL,
    [RefOC]          VARCHAR (200)    NULL,
    [Observaciones]  TEXT             NULL,
    [Anulado]        BIT              CONSTRAINT [DF_tbl_DocMov_Anulado] DEFAULT ((0)) NOT NULL,
    [UserId]         UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_tbl_DocMov] PRIMARY KEY CLUSTERED ([idDocMov] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tbl_DocMov]
    ON [dbo].[tbl_DocMov]([Serie] ASC, [NumDoc] ASC, [idTranType] ASC);

