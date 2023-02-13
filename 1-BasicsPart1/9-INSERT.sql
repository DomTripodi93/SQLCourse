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

INSERT INTO Inventory.Furniture (FurnitureType
                                 , FurnitureName
                                 , Price
                                 , Quantity
                                 , Discontinued
                                 , ReleaseDate
                                 , CreateDate
                                 , UpdateDate
                                 , FunitureSubcategory)
VALUES ('Couch'
		, 'Super Delux Sectional'
		, 249.99
		, 14
		, 0
		, '2023-02-15'
		, GETDATE ()
		, DATEFROMPARTS (2023, 02, 15)
		, 'Living Root'
);
GO