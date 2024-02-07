SELECT lname, ssn, bdate
    FROM employee
    WHERE bdate LIKE '%07___';

SELECT fname, lname, salary
    FROM employee
    WHERE salary > (
        SELECT MAX(salary)
        FROM employee
        WHERE dno = 5
    );

SELECT salary * 1.2 AS updated_salary
    FROM employee AS e, project AS p, works_on AS w
    WHERE w.essn = e.ssn
        AND w.pno = p.pnumber
        AND p.pname = 'ProductY'
        AND e.salary BETWEEN 20000 AND 45000;

SELECT DISTINCT ssn
    FROM employee AS e, works_on AS w
    WHERE w.pno BETWEEN 1 AND 3
        AND e.sex = 'M';

SELECT p.pnumber, p.pname, AVG(e.salary) AS average_salary
    FROM project AS p, works_on AS w, employee AS e
    WHERE w.pno = p.pnumber AND e.ssn = w.essn
    GROUP BY w.pno
    HAVING COUNT(w.pno) > 1;
