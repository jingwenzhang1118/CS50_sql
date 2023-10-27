SELECT "d"."name", "pubs"."num_pub_schools", "chars"."num_char_schools"
FROM "districts" AS "d"
LEFT JOIN (
    SELECT "district_id", COUNT(*) AS "num_pub_schools" FROM "schools"
    WHERE "type" = "Public School"
    GROUP BY "district_id"
    ) AS "pubs"
ON "d"."id" = "pubs"."district_id"
LEFT JOIN (
    SELECT "district_id", COUNT(*) AS "num_char_schools" FROM "schools"
    WHERE "type" = "Charter School"
    GROUP BY "district_id"
    ) AS "chars"
ON "d"."id" = "chars"."district_id"; 