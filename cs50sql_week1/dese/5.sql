SELECT "count"."city", "schools"."name" FROM (
    SELECT "city", COUNT("city") as "num_schools" FROM "schools"
    WHERE "type" = 'Public School'
    GROUP BY "city"
    ORDER BY "num_schools", "city"
) as 'count'
NATURAL JOIN "schools"
WHERE "count"."num_schools" <= 3; -- This Where clause cannot be added to the subquery directly