SELECT fname, lname, bdate
    FROM employee
    WHERE salary < 35000;

SELECT pnumber, plocation
    FROM project, department
    WHERE dname = 'Administration';

SELECT fname, lname, ssn
    FROM employee, project, works_on
    WHERE pno = 10 AND hours > 10;

SELECT d.dependent_name, d.bdate, d.relationship
    FROM employee AS e, dependent AS d
    WHERE e.dno = 5 AND d.sex = 'M';

SELECT fname, lname, bdate, salary
    FROM project AS p, department AS d, employee
    WHERE plocation = 'Houston' AND dnum = d.dnumber AND ssn = d.mgr_ssn;
