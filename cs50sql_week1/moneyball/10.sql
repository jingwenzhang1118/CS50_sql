SELECT "pl"."first_name", "pl"."last_name", "p"."year",
    "s"."salary", "p"."HR"
FROM "performances" AS "p"
JOIN "salaries" AS "s"
ON "s"."player_id" = "p"."player_id" AND "s"."year" = "p"."year"
JOIN "players" AS "pl"
ON "pl"."id" = "p"."player_id"
ORDER BY "p"."player_id", "p"."year" DESC, "HR" DESC, "salary" DESC;