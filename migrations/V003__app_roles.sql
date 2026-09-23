-- V003: Least-privilege roles
-- kimtay_readonly: reporting tools; can only read.
-- kimtay_app: the web app; can read and write orders, nothing else.
-- NOLOGIN roles hold permissions; real logins are granted these roles later.

CREATE ROLE kimtay_readonly NOLOGIN;
CREATE ROLE kimtay_app NOLOGIN;

REVOKE ALL ON ALL TABLES IN SCHEMA public FROM public;

GRANT USAGE ON SCHEMA public TO kimtay_readonly, kimtay_app;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO kimtay_readonly;

GRANT SELECT ON customer, product, category TO kimtay_app;
GRANT SELECT, INSERT, UPDATE ON orders, order_line TO kimtay_app;
