CREATE VIEW "frequently_reviewed" AS
SELECT "id", "property_type", "host_name", "r"."reviews" FROM "listings"
JOIN (SELECT "listing_id", COUNT() AS "reviews" FROM "reviews"
    GROUP BY "listing_id" ORDER BY COUNT() DESC LIMIT 100) AS "r"
ON "listings"."id" = "r"."listing_id";
