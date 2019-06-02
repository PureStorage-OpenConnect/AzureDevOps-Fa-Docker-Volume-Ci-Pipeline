CREATE TABLE [dbo].[LineItem] (
    [L_OrderKey]      INT             NOT NULL,
    [L_PartKey]       INT             NOT NULL,
    [L_SuppKey]       INT             NOT NULL,
    [L_LineNumber]    INT             NOT NULL,
    [L_Quantity]      INT             NOT NULL,
    [L_ExtendedPrice] DECIMAL (13, 2) NOT NULL,
    [L_Discount]      DECIMAL (13, 2) NOT NULL,
    [L_Tax]           DECIMAL (13, 2) NOT NULL,
    [L_ReturnFlag]    VARCHAR (64)    NOT NULL,
    [L_LineStatus]    VARCHAR (64)    NOT NULL,
    [L_ShipDate]      DATETIME        NOT NULL,
    [L_CommitDate]    DATETIME        NOT NULL,
    [L_ReceiptDate]   DATETIME        NOT NULL,
    [L_ShipInstruct]  VARCHAR (64)    NOT NULL,
    [L_ShipMode]      VARCHAR (64)    NOT NULL,
    [L_Comment]       VARCHAR (64)    NOT NULL,
    [column17]        NVARCHAR (1)    NULL
);

