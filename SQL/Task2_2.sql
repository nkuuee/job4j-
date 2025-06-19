CREATE
OR REPLACE FUNCTION tax_2()
    RETURNS TRIGGER AS
$$
BEGIN
    NEW.price
:= NEW.price * 1.2;
RETURN NEW;
end;
$$
LANGUAGE plpgsql;

CREATE TRIGGER tax_trigger2
    BEFORE INSERT
    ON products
    FOR EACH ROW
    EXECUTE FUNCTION tax_2();
INSERT INTO products (name, producer, price)
VALUES ('Телефон', 'Nokia', 1000);
SELECT *
FROM products;
