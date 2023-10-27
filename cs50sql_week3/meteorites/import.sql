DROP TABLE IF EXISTS "meteorites_temp";
CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" NUMERIC DEFAULT NULL,
    "discovery" TEXT Check("discovery" IN ('Fell', 'Found')),
    "year" INTEGER DEFAULT NULL,
    "lat" NUMERIC DEFAULT NULL,
    "long" NUMERIC DEFAULT NULL
);

.import --csv --skip 1 meteorites.csv meteorites_temp

-- set empty values to NULL
-- sqlite3 imports values as text, so statement WHERE "mass" is NULL does not work.
UPDATE "meteorites_temp" SET "mass" = NULL
WHERE "mass" = '';
UPDATE "meteorites_temp" SET "year" = NULL
WHERE "year" = '';
UPDATE "meteorites_temp" SET "lat" = NULL
WHERE "lat" = '';
UPDATE "meteorites_temp" SET "long" = NULL
WHERE "long" = '';


-- Control decimals
UPDATE "meteorites_temp" SET "mass" = ROUND("mass", 2);
UPDATE "meteorites_temp" SET "lat" = ROUND("lat", 2);
UPDATE "meteorites_temp" SET "long" = ROUND("long", 2);

-- DELECT nametype = relict
DELETE FROM "meteorites_temp"
WHERE "nametype" = 'Relict';

/* ORDER the data
SELECT * FROM "meteorites_temp"
ORDER BY "year", "name";*/


-- CREATE the main table
CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" NUMERIC DEFAULT NULL,
    "discovery" TEXT Check("discovery" IN ('Fell', 'Found')),
    "year" INTEGER DEFAULT NULL,
    "lat" NUMERIC DEFAULT NULL,
    "long" NUMERIC DEFAULT NULL,
    PRIMARY KEY ("id")
);

-- INSERT value from another table with certain order
INSERT INTO "meteorites" ("name","class","mass","discovery","year","lat","long")
SELECT "name","class","mass","discovery","year","lat","long" FROM "meteorites_temp"
ORDER BY "year", "name";

-- drop temporary table
DROP TABLE "meteorites_temp";