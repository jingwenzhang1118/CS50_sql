SELECT "e"."district_id", "e"."pupils", "d"."name"
FROM "expenditures" AS "e", "districts" AS "d"
WHERE "e"."district_id" = "d"."id" -- Cannot use JOIN here, but WHERE is equal to JOIN here.
