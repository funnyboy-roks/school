DROP TRIGGER IF EXISTS auto_inventory_price;
DELIMITER $$
CREATE TRIGGER auto_inventory_price
BEFORE INSERT ON inventory
FOR EACH ROW
BEGIN
    IF NEW.sale_price IS NULL THEN
        SET NEW.sale_price = 1.3 * NEW.value_per_ea;
    END IF;
END$$
DELIMITER ;
