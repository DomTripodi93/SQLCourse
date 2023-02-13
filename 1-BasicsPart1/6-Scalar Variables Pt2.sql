USE TestDatabase;
GO

CREATE TYPE dbo.String FROM VARCHAR(255);

DECLARE @StringValue dbo.String = 'some value less than 256 characters';

SELECT  @StringValue;

--Regulate type length/precision/scale
SELECT  t1.[name]
        , t2.[name] AS BaseDataType
        , t1.max_length AS bytes
        , t1.[precision]
        , t1.scale
        , t2.default_object_id
        , t1.default_object_id
  FROM  sys.types t1
      JOIN sys.types t2
          ON t2.system_type_id = t1.system_type_id
             AND t2.is_user_defined = 0
 WHERE  t1.is_user_defined = 1
        AND t2.[name] <> 'sysname'
 ORDER BY t1.[name];
GO