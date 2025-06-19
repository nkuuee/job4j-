CREATE TABLE products
(
    id       serial primary key,
    name     varchar(50),
    producer varchar(50),
    count    integer default 0,
    price    integer
);

CREATE
OR REPLACE FUNCTION tax()
    RETURNS TRIGGER AS
$$
BEGIN
UPDATE products
SET price = price * 1.2
WHERE id IN (SELECT id FROM inserted);
RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER tax_trigger
    AFTER INSERT
    ON products
    REFERENCING NEW TABLE AS
                    inserted
    FOR EACH STATEMENT
EXECUTE FUNCTION tax();

INSERT INTO products (name, producer, price)
VALUES ('Тест', 'Производитель', 100);
SELECT *
FROM products;