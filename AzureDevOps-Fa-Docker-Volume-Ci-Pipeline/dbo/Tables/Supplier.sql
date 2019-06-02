CREATE TABLE [dbo].[Supplier] (
    [S_SuppKey]   INT             NOT NULL,
    [S_Name]      VARCHAR (64)    NOT NULL,
    [S_Address]   VARCHAR (64)    NOT NULL,
    [S_NationKey] INT             NOT NULL,
    [S_Phone]     VARCHAR (18)    NOT NULL,
    [S_AcctBal]   DECIMAL (13, 2) NOT NULL,
    [S_Comment]   VARCHAR (105)   NOT NULL,
    [column_8]    NVARCHAR (1)    NULL
);

