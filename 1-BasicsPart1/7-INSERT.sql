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
);
GO

INSERT INTO Inventory.Furniture(
    [FurnitureType],
    [FurnitureName],
    [Price],
    [Quantity],
    [ReleaseDate],
    [CreateDate],
    [UpdateDate]
) VALUES (
    'Couch',
    'The Super Delux Sectional',
    1299.99,
    34,
    '2023-08-15',
    '2023-08-15 20:00:00',
    '2023-08-15 20:00:00'
);
GO