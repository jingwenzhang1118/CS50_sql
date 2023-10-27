SELECT "d"."name", "avg_exp"."per_pupil_expenditure", "avg_rating"."exemplary"
FROM "districts" AS "d"
JOIN (
    SELECT "district_id", "per_pupil_expenditure" FROM "expenditures"
    WHERE "per_pupil_expenditure" > (
        SELECT AVG("per_pupil_expenditure") FROM "expenditures"
    )
) AS "avg_exp" -- Note where to put the paranthesis
ON "d"."id" = "avg_exp"."district_id"
JOIN (
    SELECT "district_id", "exemplary" FROM "staff_evaluations"
    WHERE "exemplary" > (
    SELECT AVG("exemplary") FROM "staff_evaluations"
    )
) AS "avg_rating"
ON "d"."id" = "avg_rating"."district_id";
ORDER BY "avg_rating"."exemplary" DESC, "avg_exp"."per_pupil_expenditure" DESC;
