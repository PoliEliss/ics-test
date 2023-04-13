
CREATE PROCEDURE [dbo].[usp_MakeFamilyPurchase]
    @FamilySurName varchar(255)
AS
BEGIN
    
    IF NOT EXISTS (SELECT * FROM dbo.Family WHERE SurName = @FamilySurName)
    BEGIN
      PRINT 'Такой семьи нет'
       RETURN
   END
    DECLARE @TotalPurchase INT
    SELECT @TotalPurchase = SUM(Value) FROM dbo.Basket WHERE ID_Family = @FamilySurName
    UPDATE dbo.Family
    SET BudgetValue = BudgetValue - @TotalPurchase
    WHERE SurName = @FamilySurName
END
