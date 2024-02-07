DELIMITER $$
CREATE TRIGGER default_dept_location
AFTER INSERT ON department
FOR EACH ROW
BEGIN
    INSERT INTO dept_locations VALUES (NEW.dnumber, 'Belaire');
END$$
DELIMITER;

DELIMITER $$
CREATE TRIGGER restrict_salary
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    IF NEW.salary > (SELECT salary FROM employee WHERE employee.ssn = NEW.super_ssn)
    THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Please provide correct value for the employee salary.';
    END IF;
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER set_super_ssn
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    IF NEW.super_ssn IS NULL
    THEN
    SET NEW.super_ssn = (
        SELECT ssn FROM employee WHERE employee.ssn =
        (SELECT mgr_ssn FROM department WHERE department.dnumber = NEW.dno)
    );
    END IF;
END$$
DELIMITER ;

CREATE VIEW dept_mgrs
AS SELECT fname, lname, ssn, dno AS department_number,
    (SELECT dname FROM department WHERE mgr_ssn = ssn) AS department_name
    FROM employee
    WHERE ssn IN (SELECT mgr_ssn FROM department);

CREATE VIEW proj_info
AS SELECT p.pnumber, p.pname, d.dnumber, d.dname,
    COUNT(e.ssn) AS num_employee,
    SUM(e.salary) AS total_salary,
    SUM(w.hours) AS total_hours
    FROM ((
        employee AS e JOIN works_on AS w ON e.ssn = w.essn
        ) JOIN project AS p ON w.pno = p.pnumber
    ) JOIN department AS d ON d.dnumber = p.dnum
    GROUP BY p.pnumber;
