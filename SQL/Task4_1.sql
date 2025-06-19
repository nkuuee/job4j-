DROP TABLE IF EXISTS products;

CREATE TABLE products
(
    id       SERIAL PRIMARY KEY,
    name     TEXT,
    quantity INT
);

INSERT INTO products (name, quantity)
VALUES ('Product A', 10),
       ('Product B', 20);

BEGIN;
UPDATE products
SET quantity = quantity + 10
WHERE name = 'Product A';

BEGIN;
SELECT *
FROM products
WHERE name = 'Product A';

COMMIT;

COMMIT;


BEGIN
TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT *
FROM products
WHERE name = 'Product A';


BEGIN;
UPDATE products
SET quantity = quantity + 5
WHERE name = 'Product A';
COMMIT;


SELECT *
FROM products
WHERE name = 'Product A';

COMMIT;


BEGIN
TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT *
FROM products
WHERE name = 'Product B';


BEGIN
TRANSACTION ISOLATION LEVEL SERIALIZABLE;
UPDATE products
SET quantity = quantity + 1
WHERE name = 'Product B';
COMMIT;


UPDATE products
SET quantity = quantity + 1
WHERE name = 'Product B';
COMMIT;


