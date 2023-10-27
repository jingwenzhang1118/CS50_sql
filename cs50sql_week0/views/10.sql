SELECT "english_title", "brightness" as "Dark prints"
FROM "views"
WHERE "brightness" <= 0.5
ORDER BY "artist", "brightness";