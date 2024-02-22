-- Number of members who attend each class
SELECT c.id, c.name, COUNT(t.class_id) AS num_attendees
    FROM teaches_class AS t JOIN class AS c ON t.class_id = c.id
    GROUP BY t.class_id;

-- Show each class offered on Monday
SELECT c.*
FROM class AS c
    WHERE c.id IN (
        SELECT class_id
        FROM days_offered
        WHERE day = 0
    );

-- Value of all items in inventory
SELECT SUM(iv.value_per_ea * iv.quantity) AS inventory_value
    FROM inventory AS iv;

-- All members who are in two or more classes
SELECT * FROM member WHERE member_id IN (
    SELECT member_id FROM teaches_class
    GROUP BY member_id
    HAVING COUNT(member_id) >= 2
);

-- Classes taught by instructors whose name starts with 'J'
SELECT DISTINCT c.*
FROM class AS c, teaches_class AS t
WHERE t.instructor_ssn IN (
    SELECT ssn
        FROM instructors
        WHERE fname LIKE 'J%'
);
