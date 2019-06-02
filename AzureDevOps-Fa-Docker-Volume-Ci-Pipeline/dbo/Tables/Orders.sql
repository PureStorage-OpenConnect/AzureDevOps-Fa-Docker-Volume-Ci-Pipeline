CREATE TABLE [dbo].[Orders] (
    [O_OrderKey]     INT             NOT NULL,
    [O_CustKey]      INT             NOT NULL,
    [O_OrderStatus]  VARCHAR (64)    NOT NULL,
    [O_TotalPrice]   DECIMAL (13, 2) NOT NULL,
    [O_OrderDate]    DATETIME        NOT NULL,
    [O_OrderPriorty] VARCHAR (15)    NOT NULL,
    [O_Clerk]        VARCHAR (64)    NOT NULL,
    [O_ShipPriority] INT             NOT NULL,
    [O_Comment]      VARCHAR (80)    NOT NULL,
    [column10]       NVARCHAR (1)    NULL
);

