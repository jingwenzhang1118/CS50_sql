CREATE VIEW "june_vacancies" AS
SELECT "id", "property_type", "host_name", "a"."days_vacant"  FROM "listings"
JOIN (
    SELECT "listing_id", COUNT() AS "days_vacant" FROM "availabilities"
    WHERE "available" = 'TRUE' AND "date" BETWEEN '2023-06-01' AND '2023-06-30'
    GROUP BY "listing_id") AS "a"
ON "listings"."id" = "a"."listing_id";

