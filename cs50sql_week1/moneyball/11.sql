SELECT "first_name", "last_name", ("salary"/"H") AS "dollars per hit" FROM (
    SELECT * FROM "performances" WHERE "year" = 2001 AND "H" > 0
) AS "p" -- limit the data first to speed up matching
JOIN (SELECT "player_id", "salary" FROM "salaries"
WHERE "year" = 2001) AS "s"
ON "p"."player_id" = "s"."player_id"
JOIN "players" AS "pl" ON "p"."player_id" = "pl"."id"
ORDER BY "dollars per hit", "first_name", "last_name"
LIMIT 10;
