INSERT INTO "ingredients" ("name", "price per unit", "unit")
VALUES
    ('Cocoa', '5.00', 'pound'),
    ('Sugar', '2.00', 'pound'),
    ('Flour', NULL, NULL),
    ('Buttermilk', NULL, NULL),
    ('Sprinkles', NULL, NULL);

INSERT INTO "donuts" ("name", "gluten_free", "price")
VALUES
    ('Belgian Dark Chocolate', '0', '4.00'),
    ('Back-To-School Sprinkles', '0', '4.00');

INSERT INTO "donuts_ingredients"("donut_id", "ingredient_id")
VALUES
    -- brackets are needed for each subquery
    ((SELECT "id" FROM "donuts" WHERE "name" = 'Belgian Dark Chocolate'),
    (SELECT "id" FROM "ingredients" WHERE "name" = 'Cocoa')),
    ((SELECT "id" FROM "donuts" WHERE "name" = 'Belgian Dark Chocolate'),
    (SELECT "id" FROM "ingredients" WHERE "name" = 'Flour')),
    ((SELECT "id" FROM "donuts" WHERE "name" = 'Belgian Dark Chocolate'),
    (SELECT "id" FROM "ingredients" WHERE "name" = 'Buttermilk')),
    ((SELECT "id" FROM "donuts" WHERE "name" = 'Belgian Dark Chocolate'),
    (SELECT "id" FROM "ingredients" WHERE "name" = 'Sugar')),
    ((SELECT "id" FROM "donuts" WHERE "name" = 'Back-To-School Sprinkles'),
    (SELECT "id" FROM "ingredients" WHERE "name" = 'Flour')),
    ((SELECT "id" FROM "donuts" WHERE "name" = 'Back-To-School Sprinkles'),
    (SELECT "id" FROM "ingredients" WHERE "name" = 'Buttermilk')),
    ((SELECT "id" FROM "donuts" WHERE "name" = 'Back-To-School Sprinkles'),
    (SELECT "id" FROM "ingredients" WHERE "name" = 'Sugar')),
    ((SELECT "id" FROM "donuts" WHERE "name" = 'Back-To-School Sprinkles'),
    (SELECT "id" FROM "ingredients" WHERE "name" = 'Sprinkles'));

INSERT INTO "customers"("first_name", "last_name")
VALUES ('Luis', 'Singh');

INSERT INTO "orders"("customer_id", "total_price")
VALUES
    ((SELECT "id" FROM "customers" WHERE "first_name" = 'Luis' AND "last_name" = 'Singh'),
    '20.00');

INSERT INTO "order_items"("order_id", "donut_id", "quantity", "price per unit", "subtotal")
VALUES
    ((SELECT "id" FROM "orders" WHERE customer_id = (
        SELECT "id" FROM "customers" WHERE "first_name" = 'Luis' AND "last_name" = 'Singh'
    )),
    (SELECT "id" FROM "donuts" WHERE "name" = 'Belgian Dark Chocolate'),
    '3', '4.00', '12.00'),
    ((SELECT "id" FROM "orders" WHERE customer_id = (
        SELECT "id" FROM "customers" WHERE "first_name" = 'Luis' AND "last_name" = 'Singh'
    )),
    (SELECT "id" FROM "donuts" WHERE "name" = 'Back-To-School Sprinkles'),
    '2', '4.00', '8.00');
