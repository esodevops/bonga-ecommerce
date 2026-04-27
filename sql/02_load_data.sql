BEGIN;

TRUNCATE TABLE orderitems,
orders,
customers,
products RESTART IDENTITY CASCADE;

COPY products (product_id, name, price, category)
FROM
    '/workspace/data/raw/products.csv' WITH (FORMAT csv, HEADER true);

COPY customers (customer_id, name, email)
FROM
    '/workspace/data/raw/customers.csv' WITH (FORMAT csv, HEADER true);

COPY orders (order_id, customer_id, order_date)
FROM
    '/workspace/data/raw/orders.csv' WITH (FORMAT csv, HEADER true);

COPY orderitems (order_item_id, order_id, product_id, quantity)
FROM
    '/workspace/data/raw/orderitems.csv' WITH (FORMAT csv, HEADER true);

COMMIT;