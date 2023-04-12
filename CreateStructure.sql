
CREATE TABLE dbo.SKU(
 IDidentity INT CONSTRAINT sku_ididentity_pk PRIMARY KEY,
 Code VARCHAR(50) NOT NULL CONSTRAINT sku_code_unique UNIQUE,
 Name VARCHAR(60) NOT NULL
  );

CREATE TRIGGER trigger_change_cod
 ON dbo.SKU
 AFTER INSERT
 AS 
 BEGIN
 UPDATE dbo.SKU
 SET Code = 's' + CAST(IDidentity as VARCHAR(30)) from  dbo.SKU
 END;


CREATE TABLE dbo.Family(
 IDidentity INT CONSTRAINT family_ididentity_pk PRIMARY KEY,
 Surname VARCHAR(50),
 BudgetValue INT NOT NULL
);
