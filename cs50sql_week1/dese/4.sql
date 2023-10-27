SELECT "top10"."city", "schools"."name" FROM (
    -- select from a subquery
    SELECT "city", COUNT("city") as "num_schools" FROM "schools"
    WHERE "type" = 'Public School'
    GROUP BY "city"
    ORDER BY "num_schools" DESC, "city"
    LIMIT 10
) as 'top10'
NATURAL JOIN "schools"

