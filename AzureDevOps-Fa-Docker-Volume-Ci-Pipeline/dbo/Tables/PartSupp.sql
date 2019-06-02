CREATE TABLE [dbo].[PartSupp] (
    [PS_PartKey]    INT             NOT NULL,
    [PS_SuppKey]    INT             NOT NULL,
    [PS_AvailQty]   INT             NOT NULL,
    [PS_SupplyCost] DECIMAL (13, 2) NOT NULL,
    [PS_Comment]    VARCHAR (200)   NOT NULL,
    [column6]       NVARCHAR (1)    NULL
);

