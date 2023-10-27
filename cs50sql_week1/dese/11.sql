SELECT "s"."name", "e"."per_pupil_expenditure", "g"."graduated"
FROM "schools" AS "s"
JOIN "graduation_rates" AS "g" ON  "s"."id" = "g"."school_id"
JOIN "expenditures" AS "e" ON "s"."district_id" = "e"."district_id"
ORDER BY "e"."per_pupil_expenditure" DESC, "s"."name";