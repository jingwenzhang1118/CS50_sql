SELECT "first_name", "last_name" FROM (
    SELECT "player_id", "first_name", "last_name" FROM
        (SELECT "p"."player_id", "first_name","last_name", ("salary"/"RBI") AS "dollars per rbi"
            FROM (
            SELECT * FROM "performances" WHERE "year" = 2001 AND "RBI" > 0
        ) AS "p" -- limit the data first to speed up matching
        JOIN (SELECT "player_id", "salary" FROM "salaries"
        WHERE "year" = 2001) AS "s"
        ON "p"."player_id" = "s"."player_id"
        JOIN "players" AS "pl" ON "p"."player_id" = "pl"."id"
        ORDER BY "dollars per rbi", "first_name", "last_name"
        LIMIT 10)
    INTERSECT
    SELECT "player_id", "first_name", "last_name" FROM
        (SELECT "p"."player_id", "first_name", "last_name",
        ("salary"/"H") AS "dollars per hit"
            FROM (
            SELECT * FROM "performances" WHERE "year" = 2001 AND "H" > 0
        ) AS "p" -- limit the data first to speed up matching
        JOIN (SELECT "player_id", "salary" FROM "salaries"
        WHERE "year" = 2001) AS "s"
        ON "p"."player_id" = "s"."player_id"
        JOIN "players" AS "pl" ON "p"."player_id" = "pl"."id"
        ORDER BY "dollars per hit", "first_name", "last_name"
        LIMIT 10)
)
ORDER BY "player_id";