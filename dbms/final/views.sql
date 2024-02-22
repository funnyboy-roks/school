-- Show the info for the managers
DROP VIEW IF EXISTS managers;
CREATE VIEW managers
AS SELECT * FROM employee NATURAL JOIN manager;

-- Show the info for the instructors
DROP VIEW IF EXISTS instructors;
CREATE VIEW instructors
AS SELECT employee.*, instructor.supervisor_ssn FROM employee NATURAL JOIN instructor;

-- Show the total value of all items in the inventory
DROP VIEW IF EXISTS inventory_value;
CREATE VIEW inventory_value
AS SELECT id, item_name, value_per_ea * quantity AS value, sale_price 
FROM inventory;
