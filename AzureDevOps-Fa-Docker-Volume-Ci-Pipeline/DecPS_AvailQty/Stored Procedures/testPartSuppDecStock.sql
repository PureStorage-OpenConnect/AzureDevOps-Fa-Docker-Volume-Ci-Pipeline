


CREATE PROCEDURE [DecPS_AvailQty].[testPartSuppDecStock]
AS
BEGIN
    DECLARE  @ExpectedQty bigint
	        ,@ActualQty   bigint

	SELECT @ExpectedQty = SUM(CAST(PS_AvailQty AS bigint) - 1)
	FROM   PartSupp
	WHERE  PS_AvailQty > 0;

  	UPDATE PartSupp
	SET    PS_AvailQty = PS_AvailQty - 1
	WHERE  PS_AvailQty > 0;

	SELECT @ActualQty = SUM(CAST(PS_AvailQty AS bigint))
	FROM   PartSupp;

    EXEC tSQLt.AssertEquals @ExpectedQty , @ActualQty;
END;
