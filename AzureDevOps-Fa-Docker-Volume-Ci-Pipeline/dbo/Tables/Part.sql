CREATE TABLE [dbo].[Part] (
    [P_PartKey]     INT             NOT NULL,
    [P_Name]        VARCHAR (64)    NOT NULL,
    [P_Mftr]        VARCHAR (64)    NOT NULL,
    [P_Brand]       VARCHAR (64)    NOT NULL,
    [P_Type]        VARCHAR (64)    NOT NULL,
    [P_Size]        INT             NOT NULL,
    [P_Container]   VARCHAR (64)    NOT NULL,
    [P_RetailPrice] DECIMAL (13, 2) NOT NULL,
    [P_Comment]     VARCHAR (64)    NOT NULL,
    [column_10]     VARCHAR (64)    NULL
);

