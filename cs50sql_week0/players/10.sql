SELECT MIN("weight") as "Min weight",
    MAX("weight") as "Max weight",
    strftime("%Y", "debut") as "Year"
FROM "players"
WHERE "birth_country" = "USA"
GROUP BY "Year"
ORDER BY "Year";



/* More comfortable question
SELECT "first_name", "last_name", "height" FROM "players"
WHERE "height" >
    (SELECT AVG("height") FROM "players"); -- calculate average value */

