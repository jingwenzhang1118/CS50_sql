SELECT "english_title", "artist" FROM "views"
    ORDER BY "brightness" DESC
    LIMIT 1;

/*Alternatively, select from a subset
SELECT "english_title", "artist"
FROM (SELECT MAX("brightness"), "english_title", "artist"
        FROM "views");
*/