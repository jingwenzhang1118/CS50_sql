/* Find the name used for united states in the table
SELECT DISTINCT("birth_country") FROM "players"
ORDER BY "birth_country"; */

SELECT "first_name", "last_name" FROM "players"
WHERE "birth_country" != "USA"
ORDER BY "first_name", "last_name";