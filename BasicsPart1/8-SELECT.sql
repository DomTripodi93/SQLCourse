USE TestDatabase;
GO

SELECT  *
  FROM  Inventory.Furniture;

SELECT  FurnitureId
        , FurnitureType
        , FurnitureName
        , Price
        , Quantity
        , Discontinued
        , ReleaseDate
        , CreateDate
        , UpdateDate
        , FunitureSubcategory
  FROM  Inventory.Furniture;

SELECT  Furniture.FurnitureId
        , Furniture.FurnitureType
        , Furniture.FurnitureName
        , Furniture.Price
        , Furniture.Quantity
        , Furniture.Discontinued
        , Furniture.ReleaseDate
        , Furniture.CreateDate
        , Furniture.UpdateDate
        , Furniture.FunitureSubcategory
  FROM  Inventory.Furniture;
GO