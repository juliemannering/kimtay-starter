-- V001: KimTay Pet Supplies core tables (7 tables)
-- Order matters: parent tables are created before the tables that reference them.

CREATE TABLE sales_rep (
    rep_id CHAR(2) PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(80) UNIQUE NOT NULL,
    commission_rate NUMERIC(4, 3) NOT NULL DEFAULT 0.050
    CHECK (commission_rate BETWEEN 0 AND 0.200)
);

CREATE TABLE customer (
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(80) UNIQUE NOT NULL,
    phone VARCHAR(15),
    street VARCHAR(60),
    city VARCHAR(40),
    state CHAR(2),
    postal_code VARCHAR(10),
    credit_limit NUMERIC(8, 2) NOT NULL DEFAULT 500.00
    CHECK (credit_limit >= 0),
    rep_id CHAR(2) REFERENCES sales_rep (rep_id)
);

CREATE TABLE category (
    category_id INTEGER PRIMARY KEY,
    category_name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE supplier (
    supplier_id INTEGER PRIMARY KEY,
    supplier_name VARCHAR(60) NOT NULL,
    contact_email VARCHAR(80),
    payment_terms VARCHAR(10) NOT NULL DEFAULT 'NET30'
);

CREATE TABLE product (
    product_id CHAR(4) PRIMARY KEY,
    description VARCHAR(60) NOT NULL,
    category_id INTEGER NOT NULL REFERENCES category (category_id),
    supplier_id INTEGER NOT NULL REFERENCES supplier (supplier_id),
    unit_price NUMERIC(7, 2) NOT NULL CHECK (unit_price > 0),
    on_hand INTEGER NOT NULL DEFAULT 0 CHECK (on_hand >= 0)
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES customer (customer_id),
    order_date DATE NOT NULL DEFAULT CURRENT_DATE,
    status VARCHAR(10) NOT NULL DEFAULT 'PENDING'
    CHECK (status IN ('PENDING', 'SHIPPED', 'DELIVERED', 'CANCELLED'))
);

CREATE TABLE order_line (
    order_id INTEGER NOT NULL REFERENCES orders (order_id) ON DELETE CASCADE,
    product_id CHAR(4) NOT NULL REFERENCES product (product_id),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    quoted_price NUMERIC(7, 2) NOT NULL CHECK (quoted_price >= 0),
    PRIMARY KEY (order_id, product_id)
);

CREATE INDEX idx_customer_rep ON customer (rep_id);
CREATE INDEX idx_product_category ON product (category_id);
CREATE INDEX idx_orders_customer ON orders (customer_id);
