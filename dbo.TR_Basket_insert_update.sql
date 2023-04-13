CREATE TRIGGER trg_InsertBasket ON dbo.Basket
AFTER INSERT
AS
BEGIN
    WITH cte_DuplicateID_SKU
    AS (
        SELECT ID_SKU
        FROM dbo.Basket
        WHERE ID_SKU IN (
            SELECT ID_SKU
            FROM inserted
            GROUP BY ID_SKU
            HAVING COUNT(*) > 1
        )
    )
    UPDATE dbo.Basket
    SET DiscountValue = CASE 
                            WHEN Basket.ID_SKU IN (SELECT ID_SKU FROM cte_DuplicateID_SKU) 
                                THEN Basket.Value * 0.05 
                            ELSE 0
                        END
    FROM dbo.Basket 
    INNER JOIN inserted i ON Basket.ID_SKU  = i.ID_SKU 
    WHERE Basket.ID_SKU = i.ID_SKU
END
