


CREATE PROCEDURE [IncL_Tax].[testLineItemTaxIncrease]
AS
BEGIN
    DECLARE  @ExpectedSum DECIMAL(13,3) 
	        ,@ActualSum   DECIMAL(13,3)

	SELECT @ExpectedSum = SUM(L_Tax + 0.01)
	FROM   LineItem;

  	UPDATE LineItem
	SET    L_Tax = L_Tax + 0.01;

	SELECT @ActualSum = SUM(L_Tax)
	FROM   LineItem;

    EXEC tSQLt.AssertEquals @ExpectedSum , @ActualSum;
END;
