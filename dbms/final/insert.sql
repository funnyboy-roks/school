INSERT INTO employee VALUES ('111222333', 'John', 'M', 'Smith', 20000);
INSERT INTO employee VALUES ('222333444', 'Gale', 'A', 'Peach', 40000);
INSERT INTO employee VALUES ('333444555', 'Jake', 'R', 'Apple', 60000);
INSERT INTO employee VALUES ('444555666', 'Mary', 'Y', 'Jerry', 80000);

INSERT INTO manager VALUES ('333444555');
INSERT INTO manager VALUES ('444555666');

INSERT INTO instructor VALUES ('111222333', '333444555');
INSERT INTO instructor VALUES ('222333444', '444555666');

INSERT INTO member VALUES (0, 'Jane', 'P', 'Doe', 10.53, '123 House street');
INSERT INTO member VALUES (1, 'James', 'R', 'Madison', 20.03, '124 House street');
INSERT INTO member VALUES (2, 'Braden', 'G', 'Riley', 0.00, '125 House street');
INSERT INTO member VALUES (3, 'Ryan', 'R', 'Roberts', 0.04, '126 House street');

INSERT INTO class VALUES (0, 'Aerobics', '18:30');
INSERT INTO class VALUES (1, 'Yoga',     '10:00');
INSERT INTO class VALUES (2, 'Cardio',   '12:00');

INSERT INTO days_offered VALUES(0, 0); -- Monday
INSERT INTO days_offered VALUES(0, 2); -- Wednesday
INSERT INTO days_offered VALUES(0, 4); -- Friday

INSERT INTO days_offered VALUES(1, 5); -- Saturday

INSERT INTO days_offered VALUES(2, 5); -- Saturday
INSERT INTO days_offered VALUES(2, 6); -- Sunday

INSERT INTO teaches_class VALUES ('111222333', 0, 0);
INSERT INTO teaches_class VALUES ('111222333', 0, 2);
INSERT INTO teaches_class VALUES ('111222333', 0, 3);

INSERT INTO teaches_class VALUES ('222333444', 1, 1);
INSERT INTO teaches_class VALUES ('222333444', 1, 3);

INSERT INTO teaches_class VALUES ('111222333', 2, 2);
INSERT INTO teaches_class VALUES ('111222333', 2, 3);

INSERT INTO inventory VALUES (0, '1kg weight',    5, 50, 8 );
INSERT INTO inventory VALUES (1, '5kg weight',   10, 50, 12);
INSERT INTO inventory VALUES (2, '10kg weight',  15, 50, 20);
INSERT INTO inventory VALUES (3, 'Bench Press', 500,  5, NULL);
