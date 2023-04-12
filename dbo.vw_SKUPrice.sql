CREATE VIEW  dbo.vw_SKUPrice AS select SKU.Code, SKU.Name, SKU.IDidentity,[dbo].[GetSKUPrice](SKU.IDidentity) as itemPrice  from SKU
