USE TestDatabase;
GO

CREATE TYPE dbo.String FROM VARCHAR(255);

DECLARE @StringValue dbo.String = 'some value less than 256 characters';

SELECT  @StringValue;

SELECT * FROM sys.types

--max_length = Max Bytes

--Regulate type length/precision/scale
SELECT  SelectedType.[name] AS SelectedTypeName
        , BaseType.[name] AS BaseTypeName
        , SelectedType.max_length AS SelectedTypeMaxBytes
        , SelectedType.[precision] AS SelectedTypePrecision
        , SelectedType.scale AS SelectedTypeScale
        , SelectedType.default_object_id AS SelectedTypeId
        , BaseType.default_object_id AS BaseTypeId
  FROM  sys.types SelectedType
      JOIN sys.types BaseType
          ON BaseType.system_type_id = SelectedType.system_type_id
             AND BaseType.is_user_defined = 0
 WHERE  SelectedType.is_user_defined = 1
        AND BaseType.[name] <> 'sysname'
 ORDER BY SelectedType.[name];
GO