CREATE TABLE [dbo].[Customer] (
    [C_CustKey]    INT             NOT NULL,
    [C_Name]       VARCHAR (64)    NOT NULL,
    [C_Address]    VARCHAR (64)    NOT NULL,
    [C_NationKey]  INT             NOT NULL,
    [C_Phone]      VARCHAR (64)    NOT NULL,
    [C_AcctBal]    DECIMAL (13, 2) NOT NULL,
    [C_MktSegment] VARCHAR (64)    NOT NULL,
    [C_Comment]    VARCHAR (120)   NOT NULL,
    [column_9]     NVARCHAR (1)    NULL
);

