SELECT "p"."first_name", "p"."last_name", "s"."salary"
FROM "players" AS "p"
JOIN (
    SELECT "player_id", "salary" FROM "salaries"
    WHERE "year" = 2001
) AS "s" ON "p"."id" = "s"."player_id"
ORDER BY "salary", "first_name", "last_name", "id"
-- Same as ORDER BY "s"."salary", "p"."first_name", "p"."last_name", "p"."id"
LIMIT 50;