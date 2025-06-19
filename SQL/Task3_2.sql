DROP PROCEDURE IF EXISTS delete_data();

CREATE
OR REPLACE PROCEDURE delete_data()
AS
$$
BEGIN
DELETE
FROM products
WHERE count = 0;
END;
$$
LANGUAGE plpgsql;

CALL delete_data();