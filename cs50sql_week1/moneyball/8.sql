SELECT "salary" FROM "salaries"
NATURAL JOIN (
    SELECT "player_id" FROM "performances"
    WHERE "year" = 2001
    ORDER BY "HR" DESC
    LIMIT 1
)
WHERE "year" = 2001;

/* Alternative
SELECT "salary" FROM "salaries"
WHERE "year" = 2001 and "player_id" = (
    SELECT "player_id" FROM "performances"
    WHERE "year" = 2001
    ORDER BY "HR" DESC
    LIMIT 1
);
*/