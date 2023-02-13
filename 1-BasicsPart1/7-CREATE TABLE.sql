USE TestDatabase;
GO

CREATE TABLE Inventory.Furniture
(
    FurnitureId INT IDENTITY(1, 1)
    , FurnitureType VARCHAR(255)
    , FurnitureName VARCHAR(255)
    , Price DECIMAL(18, 4)
    , Quantity INT
    , Discontinued BIT
    , ReleaseDate DATE
    , CreateDate DATETIME
    , UpdateDate DATETIME
);
GO