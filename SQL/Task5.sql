DROP TABLE IF EXISTS products;

CREATE TABLE products
(
    id    SERIAL PRIMARY KEY,
    name  VARCHAR(50),
    count INTEGER DEFAULT 0,
    price INTEGER
);

INSERT INTO products (name, count, price)
SELECT 'product_' || i, i, i * 5
FROM generate_series(1, 20) AS s(i);

BEGIN;

DECLARE
product_cursor SCROLL CURSOR FOR
SELECT *
FROM products
ORDER BY id;

FETCH LAST FROM product_cursor;

FETCH PRIOR FROM product_cursor;
FETCH PRIOR FROM product_cursor;
FETCH PRIOR FROM product_cursor;
FETCH PRIOR FROM product_cursor;
FETCH PRIOR FROM product_cursor;

FETCH PRIOR FROM product_cursor;
FETCH PRIOR FROM product_cursor;
FETCH PRIOR FROM product_cursor;
FETCH PRIOR FROM product_cursor;
FETCH PRIOR FROM product_cursor;
FETCH PRIOR FROM product_cursor;
FETCH PRIOR FROM product_cursor;
FETCH PRIOR FROM product_cursor;

FETCH PRIOR FROM product_cursor;
FETCH PRIOR FROM product_cursor;
FETCH PRIOR FROM product_cursor;
FETCH PRIOR FROM product_cursor;
FETCH PRIOR FROM product_cursor;

FETCH PRIOR FROM product_cursor;

CLOSE product_cursor;
COMMIT;
