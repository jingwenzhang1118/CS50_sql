SELECT "name" FROM "districts"
WHERE "id" IN (
    SELECT "district_id" FROM (
    SELECT "district_id", MIN("pupils") FROM "expenditures"
    )
);
