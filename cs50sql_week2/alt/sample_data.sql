INSERT INTO "passengers" ("first_name", "last_name", "age")
VALUES ('Amelia', 'Earhart', '39');

INSERT INTO "airlines" ("name", "concourse")
VALUES ('Delta', 'A, B, C, D, T');

INSERT INTO "flights" ("flight_num", "airline_id", "departure_airport",
    "arrival_airprot", "departure_datetime", "arrival_datetime")
VALUES ('900', (SELECT "id" FROM "airlines" WHERE "name" = 'Delta'), 'ATL', 'BOS', '2023-08-03 18:46:00', '2023-08-03 21:09:00');


INSERT INTO "checkins" ("passenger_id", "datetime", "flight_id")
VALUES ((SELECT "id" FROM "passengers" WHERE "first_name" = 'Amelia' AND "last_name" = 'Earhart'),
'2023-08-03 15:03:00',
(SELECT "id" FROM "flights" WHERE "flight_num" = 900 AND "airline_id" = (SELECT "id" FROM "airlines" WHERE "name" = 'Delta'))
);

