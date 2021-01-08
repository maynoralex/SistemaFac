CREATE TABLE [dbo].[tbl_RolePermission] (
    [idUsrTypePermission] INT              IDENTITY (1, 1) NOT NULL,
    [idRole]              UNIQUEIDENTIFIER NOT NULL,
    [idAppFunction]       INT              NOT NULL,
    CONSTRAINT [PK_tbl_UsrTypePermission] PRIMARY KEY CLUSTERED ([idUsrTypePermission] ASC)
);

