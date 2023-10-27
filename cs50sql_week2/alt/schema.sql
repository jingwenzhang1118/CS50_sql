CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "checkins" (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "datetime" NUMERIC,
    "flight_id" INTEGER,
    PRIMARY KEY("id")
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT,
    "concourse" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_num" INTEGER,
    "airline_id" INTEGER,
    "departure_airport" TEXT,
    "arrival_airprot" TEXT,
    "departure_datetime" NUMERIC,
    "arrival_datetime" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);