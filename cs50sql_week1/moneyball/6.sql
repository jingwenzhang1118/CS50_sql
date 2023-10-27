SELECT "name", "th"."total hits" FROM "teams"
JOIN (
    SELECT "team_id", SUM("H") AS "total hits" FROM "performances"
    WHERE "year" = 2001
    GROUP BY "team_id", "year"
    ORDER BY "total hits" DESC LIMIT 5
) AS "th"
ON "teams"."id" = "th"."team_id";