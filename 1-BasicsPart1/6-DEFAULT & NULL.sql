USE TestDatabase;
GO

DROP TABLE IF EXISTS Inventory.Furniture

CREATE TABLE Inventory.Furniture (
    FurnitureId INT IDENTITY(1,1),
    FurnitureType VARCHAR(50) NULL,
    FurnitureName VARCHAR(50) NOT NULL,
    Price DECIMAL(18,4),
    Quantity INT DEFAULT(0) NOT NULL,
    ReleaseDate DATE,
    CreateDate DATETIME,
    UpdateDate DATETIME
)
;
GO