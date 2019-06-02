


CREATE PROCEDURE [IncPS_AvailQty].[testPartSuppAddStock]
AS
BEGIN
    DECLARE  @ExpectedQty bigint
	        ,@ActualQty   bigint

	SELECT @ExpectedQty = SUM(CAST(PS_AvailQty AS bigint) + 1)
	FROM   PartSupp;

  	UPDATE PartSupp
	SET    PS_AvailQty = PS_AvailQty + 1;

	SELECT @ActualQty = SUM(CAST(PS_AvailQty AS bigint))
	FROM   PartSupp;

    EXEC tSQLt.AssertEquals @ExpectedQty , @ActualQty;
END;
