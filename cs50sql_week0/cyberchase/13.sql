-- for more comfortable problems

-- Convert date variable to Year/Month/Day using strftime()
SELECT "title", "season" FROM "episodes"
    WHERE strftime('%m', "air_date") = "12" AND "season" != 11; -- limit season is not necessary.

-- Find min/max by group
SELECT MIN(strftime('%Y', "air_date")) as "Year", MIN(strftime('%m-%d', "air_date")) as "MM-DD"
    FROM "episodes"
    GROUP BY strftime('%Y', "air_date");
