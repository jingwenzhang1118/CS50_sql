SELECT "first_name", "last_name" FROM "players"
WHERE "id" = (
    SELECT "player_id" FROM (
        SELECT "player_id", MAX("salary") FROM "salaries"
    )
);
