SELECT
    'products' AS table_name,
    COUNT(*) AS row_count
FROM
    products
UNION
ALL
SELECT
    'customers' AS table_name,
    COUNT(*) AS row_count
FROM
    customers
UNION
ALL
SELECT
    'orders' AS table_name,
    COUNT(*) AS row_count
FROM
    orders
UNION
ALL
SELECT
    'order_items' AS table_name,
    COUNT(*) AS row_count
FROM
    order_items
ORDER BY
    table_name;

SELECT
    COUNT(*) AS orphan_order_rows
FROM
    orders o
    LEFT JOIN customers c ON c.customer_id = o.customer_id
WHERE
    c.customer_id IS NULL;

SELECT
    COUNT(*) AS orphan_order_item_order_rows
FROM
    order_items oi
    LEFT JOIN orders o ON o.order_id = oi.order_id
WHERE
    o.order_id IS NULL;

SELECT
    COUNT(*) AS orphan_order_item_product_rows
FROM
    order_items oi
    LEFT JOIN products p ON p.product_id = oi.product_id
WHERE
    p.product_id IS NULL;
