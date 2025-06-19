CREATE
OR REPLACE FUNCTION deleted_data1()
    RETURNS VOID
AS
$$
BEGIN
DELETE
FROM products
WHERE count = 0;
END;
$$
LANGUAGE plpgsql;

SELECT deleted_data1();