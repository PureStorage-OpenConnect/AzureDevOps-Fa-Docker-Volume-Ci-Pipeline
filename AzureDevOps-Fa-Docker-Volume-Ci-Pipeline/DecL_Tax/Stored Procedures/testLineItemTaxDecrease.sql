

CREATE PROCEDURE [DecL_Tax].[testLineItemTaxDecrease]
AS
BEGIN
    DECLARE  @ExpectedSum DECIMAL(13,3)
	        ,@ActualSum   DECIMAL(13,3)

  	SELECT @ExpectedSum = SUM(L_Tax - 0.01)
	FROM   LineItem
	WHERE  L_Tax  BETWEEN 0 AND 0.04;

	UPDATE LineItem
	SET    L_Tax = L_Tax - 0.01
	WHERE  L_Tax  BETWEEN 0 AND 0.04;

	SELECT @ActualSum = SUM(L_Tax)
	FROM   LineItem
	WHERE  L_Tax  BETWEEN 0 AND 0.04;

    EXEC tSQLt.AssertEquals @ExpectedSum , @ActualSum;
END;