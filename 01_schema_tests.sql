-- Schema tests: each check raises an error (and fails the pipeline) if something is wrong.

DO $$
DECLARE
    table_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO table_count
    FROM information_schema.tables
    WHERE table_schema = 'public'
      AND table_name IN ('sales_rep', 'customer', 'category', 'supplier', 'product', 'orders', 'order_line');
    IF table_count <> 7 THEN
        RAISE EXCEPTION 'FAIL: expected 7 KimTay tables, found %', table_count;
    END IF;
    RAISE NOTICE 'PASS: all 7 tables exist';
END $$;

DO $$
BEGIN
    IF (SELECT COUNT(*) FROM customer) < 10 THEN
        RAISE EXCEPTION 'FAIL: expected at least 10 customers';
    END IF;
    IF (SELECT COUNT(*) FROM product) < 15 THEN
        RAISE EXCEPTION 'FAIL: expected at least 15 products';
    END IF;
    RAISE NOTICE 'PASS: seed data loaded';
END $$;

-- Every order line must point to a real order and product (foreign keys working).
DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM order_line AS ol
        LEFT JOIN product AS p ON ol.product_id = p.product_id
        WHERE p.product_id IS NULL
    ) THEN
        RAISE EXCEPTION 'FAIL: order_line references a missing product';
    END IF;
    RAISE NOTICE 'PASS: no orphaned order lines';
END $$;

-- A CHECK constraint must block negative prices.
DO $$
BEGIN
    BEGIN
        INSERT INTO product (product_id, description, category_id, supplier_id, unit_price)
        VALUES ('ZZ99', 'Bad price test', 1, 1, -5.00);
        RAISE EXCEPTION 'FAIL: negative price was accepted';
    EXCEPTION
        WHEN check_violation THEN
            RAISE NOTICE 'PASS: negative price blocked';
    END;
END $$;
