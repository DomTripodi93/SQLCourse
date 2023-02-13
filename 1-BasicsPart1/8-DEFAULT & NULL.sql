USE TestDatabase;
GO

CREATE TABLE Inventory.Furniture
(
    FurnitureId INT IDENTITY(1, 1)
    , FurnitureType VARCHAR(255)
          CONSTRAINT DF_Furniture_FurnitureType
              DEFAULT ('No Type') NULL
    , FurnitureName VARCHAR(255) NOT NULL
    , Price DECIMAL(18, 4)
          CONSTRAINT DF_Furniture_Price
              DEFAULT (900.90) NOT NULL
    , Quantity INT
          CONSTRAINT DF_Furniture_Quantity
              DEFAULT (1)
    , Discontinued BIT
          CONSTRAINT DF_Furniture_Discontinued
              DEFAULT (0)
    , ReleaseDate DATE
          CONSTRAINT DF_Furniture_ReleaseDate
              DEFAULT (CAST (GETDATE () AS DATE))
    , CreateDate DATETIME
          CONSTRAINT DF_Furniture_CreateDate
              DEFAULT (GETDATE ())
    , UpdateDate DATETIME
          CONSTRAINT DF_Furniture_UpdateDate
              DEFAULT (GETDATE ())
);
GO