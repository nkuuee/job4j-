create table history_of_price
(
    id    serial primary key,
    name  varchar(50),
    price integer,
    date  timestamp
);

CREATE
OR REPLACE FUNCTION tax_3()
    RETURNS TRIGGER AS
$$
BEGIN
INSERT INTO history_of_price(name, price, date)
VALUES (NEW.name, NEW.price * 1.2, NOW());
RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER save_history_trigger
    AFTER INSERT
    ON products
    FOR EACH ROW
    EXECUTE FUNCTION tax_3();