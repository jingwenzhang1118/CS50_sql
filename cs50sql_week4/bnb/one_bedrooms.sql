CREATE VIEW "one_bedrooms" AS
SELECT "id", "property_type", "host_name", "accommodates" FROM "Listings"
WHERE "bedrooms" = 1;