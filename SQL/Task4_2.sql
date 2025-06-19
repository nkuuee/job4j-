BEGIN;

SAVEPOINT sp1;

INSERT INTO products (name, producer, price)
VALUES ('Товар 1', 'Производитель А', 100);

SELECT *
FROM products;

SAVEPOINT sp2;

INSERT INTO products (name, producer, price)
VALUES ('Товар 2', 'Производитель Б', 200);

SELECT *
FROM products;

SAVEPOINT sp3;

INSERT INTO products (name, producer, price)
VALUES ('Товар 3', 'Производитель В', 300);

SELECT *
FROM products;

ROLLBACK TO SAVEPOINT sp2;

SELECT *
FROM products;

ROLLBACK TO SAVEPOINT sp1;

SELECT *
FROM products;

COMMIT;

SELECT *
FROM products;
