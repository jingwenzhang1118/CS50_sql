CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT,
    "price per unit" NUMERIC,
    "unit" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT,
    "gluten_free" INTEGER,
    "price" NUMERIC,
    PRIMARY KEY("id")
);

CREATE TABLE "donuts_ingredients" (
    "id" INTEGER PRIMARY KEY,
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "orders" (
    "id" INTEGER,
    "customer_id" INTEGER,
    "total_price" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "order_items" (
    "id" INTEGER PRIMARY KEY,
    "order_id" INTEGER,
    "donut_id" INTEGER,
    "quantity" INTEGER,
    "price per unit" NUMERIC,
    "subtotal" NUMERIC,
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT,
    "last_name" TEXT
);