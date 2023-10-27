SELECT "districts"."name", "high_exp"."per_pupil_expenditure"
FROM "districts",
        (SELECT "district_id", "per_pupil_expenditure" FROM "expenditures"
        ORDER BY "per_pupil_expenditure" DESC
        LIMIT 10
        ) AS "high_exp" -- SELECT from two tables, one is a subquery
WHERE "districts"."id" = "high_exp"."district_id";
