SELECT "teams"."name", "s"."average salary" FROM "teams"
JOIN (
    SELECT "team_id", ROUND(AVG("salary"), 2) AS "average salary" FROM "salaries"
    WHERE "year" = 2001
    GROUP BY "team_id"
    ORDER BY "average salary"
    LIMIT 5) AS "s"
ON "teams"."id" = "s"."team_id";