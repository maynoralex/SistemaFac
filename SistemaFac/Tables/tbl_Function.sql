CREATE TABLE [dbo].[tbl_Function] (
    [idFunction]  INT           NOT NULL,
    [idModulo]    INT           NULL,
    [Description] VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_tbl_Function] PRIMARY KEY CLUSTERED ([idFunction] ASC)
);

