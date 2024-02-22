SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS manager;
DROP TABLE IF EXISTS instructor;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS teaches_class;
DROP TABLE IF EXISTS days_offered;
DROP TABLE IF EXISTS class;
DROP TABLE IF EXISTS transaction;
DROP TABLE IF EXISTS inventory;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE member (
	member_id          INTEGER        PRIMARY KEY NOT NULL,
    fname              VARCHAR(45)                NOT NULL,
    minit              CHAR                       NOT NULL,
    lname              VARCHAR(45)                NOT NULL,
    acct_balance       DECIMAL(15,2)              NOT NULL DEFAULT 0,
    address            VARCHAR(45)                NOT NULL
);

CREATE TABLE employee (
    ssn                VARCHAR(9)     PRIMARY KEY NOT NULL,
    fname              VARCHAR(32)                NOT NULL,
    minit              CHAR                       NOT NULL,
    lname              VARCHAR(32)                NOT NULL,
    salary             INTEGER                    NOT NULL
);

CREATE TABLE class (
    id                 INTEGER        PRIMARY KEY NOT NULL,
    name               VARCHAR(32)                NOT NULL,
    time               VARCHAR(5)                 NOT NULL
);

CREATE TABLE days_offered (
    class_id           INTEGER                    NOT NULL,
    day                INTEGER                    NOT NULL CHECK (day BETWEEN 0 AND 6) -- 0=Monday, ..., 6=Sunday
);

CREATE TABLE manager (
    ssn                VARCHAR(9)     PRIMARY KEY NOT NULL REFERENCES employee(ssn)
);

CREATE TABLE instructor (
    ssn                VARCHAR(9)     PRIMARY KEY NOT NULL REFERENCES employee(ssn),
    supervisor_ssn     VARCHAR(9)                          REFERENCES manager(ssn)
);

CREATE TABLE teaches_class (
    instructor_ssn     VARCHAR(9)                 NOT NULL REFERENCES instructor(ssn),
    class_id           INTEGER                    NOT NULL REFERENCES class(id),
    member_id          INTEGER                    NOT NULL REFERENCES member(member_id)
);

CREATE TABLE inventory (
    id                 INTEGER        PRIMARY KEY NOT NULL,
    item_name          VARCHAR(45)                NOT NULL UNIQUE,
    value_per_ea       DECIMAL(15,2)              NOT NULL,
    quantity           INTEGER                    NOT NULL,
    sale_price         DECIMAL(15,2)              NOT NULL
);

CREATE TABLE transaction (
    transaction_id     INTEGER                    NOT NULL,
    change_in_quantity INTEGER                    NOT NULL,
    net_income         DECIMAL(15, 2)             NOT NULL,
    item               INTEGER                    NOT NULL REFERENCES inventory(id),
    member_id          INTEGER,
    manager_ssn        VARCHAR(9),
    date               DATETIME
);

ALTER TABLE transaction
    ADD CONSTRAINT trans_member_fk
        FOREIGN KEY (member_id) REFERENCES member(member_id)
            ON DELETE SET NULL
            ON UPDATE CASCADE,
    ADD CONSTRAINT trans_mgr_fk
        FOREIGN KEY (manager_ssn) REFERENCES manager(ssn)
            ON DELETE SET NULL
            ON UPDATE CASCADE;
