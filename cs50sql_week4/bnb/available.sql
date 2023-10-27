CREATE VIEW "available" AS
SELECT "listings"."id", "property_type", "host_name", "a"."date" FROM "listings"
JOIN "availabilities" AS "a" ON "listings"."id" = "a"."listing_id";