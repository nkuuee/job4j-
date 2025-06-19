CREATE TABLE customers
(
    id         SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name  TEXT,
    age        INT,
    country    TEXT
);

INSERT INTO customers (first_name, last_name, age, country)
VALUES ('Ivan', 'Ivanov', 23, 'Russia'),
       ('Valentin', 'Alestin', 43, 'USA'),
       ('Nick', 'Taylor', 18, 'Canada');

SELECT *
FROM customers
WHERE age = (SELECT MIN(age) FROM customers);

CREATE TABLE orders
(
    id          serial primary key,
    amount      int,
    customer_id int references customers (id)
);

INSERT INTO orders (amount, customer_id)
VALUES (100, 1),
       (47, 3);

SELECT *
FROM customers
WHERE id NOT IN (SELECT customer_id FROM orders);