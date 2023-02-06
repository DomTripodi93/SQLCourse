USE TestDatabase;
GO

ALTER TABLE Inventory.Furniture ADD FunitureSubcategory VARCHAR(255);

ALTER TABLE Inventory.Furniture
ALTER COLUMN FurnitureType VARCHAR(200) NULL;

ALTER TABLE Inventory.Furniture
DROP CONSTRAINT DF_Furniture_FurnitureType;

ALTER TABLE Inventory.Furniture
ADD CONSTRAINT DF_Furniture_FurnitureType
    DEFAULT (0) FOR Discontinued;
GO