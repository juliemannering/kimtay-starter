-- Security tests: prove least privilege is in place.

DO $$
BEGIN
    IF has_table_privilege('kimtay_readonly', 'customer', 'INSERT') THEN
        RAISE EXCEPTION 'FAIL: readonly role can INSERT into customer';
    END IF;
    IF NOT has_table_privilege('kimtay_readonly', 'customer', 'SELECT') THEN
        RAISE EXCEPTION 'FAIL: readonly role cannot SELECT customer';
    END IF;
    RAISE NOTICE 'PASS: readonly role can read but not write';
END $$;

DO $$
BEGIN
    IF has_table_privilege('kimtay_app', 'customer', 'DELETE') THEN
        RAISE EXCEPTION 'FAIL: app role can DELETE customers';
    END IF;
    IF has_table_privilege('kimtay_app', 'sales_rep', 'SELECT') THEN
        RAISE EXCEPTION 'FAIL: app role can read sales_rep (commission data)';
    END IF;
    IF NOT has_table_privilege('kimtay_app', 'orders', 'INSERT') THEN
        RAISE EXCEPTION 'FAIL: app role cannot create orders';
    END IF;
    RAISE NOTICE 'PASS: app role has only what it needs';
END $$;

-- No login role other than the built-in admin should be a superuser.
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM pg_roles
        WHERE rolsuper AND rolname NOT IN ('postgres')
    ) THEN
        RAISE EXCEPTION 'FAIL: an extra superuser role exists';
    END IF;
    RAISE NOTICE 'PASS: no extra superusers';
END $$;
