INSERT INTO "users" ("first_name", "last_name", "username", "password")
VALUES
('Claudine', 'Gay', 'claudine', 'password'),
('Reid', 'Hoffman', 'reid', 'password');

INSERT INTO "schools" ("name", "type", "location", "year_founded")
VALUES ('Harvard University', 'University', 'Cambridge, Massachusetts', '1636');

INSERT INTO "companies" ("name", "industry", "location")
VALUES ('LinkedIn', 'Technology', 'Sunnyvale, California');

INSERT INTO "conn_schools" ("user_id", "school_id", "start_date", "end_date", "degree")
VALUES (
    (SELECT "id" FROM "users" WHERE "first_name" = 'Claudine' AND "last_name" = 'Gay'),
    (SELECT "id" FROM "schools" WHERE "name" = 'Harvard University'),
    '1993-01-01', '1998-12-31', 'PhD'
);

INSERT INTO "conn_companies" ("user_id", "comp_id", "start_date", "end_date", "title")
VALUES (
    (SELECT "id" FROM "users" WHERE "first_name" = 'Reid' AND "last_name" = 'Hoffman'),
    (SELECT "id" FROM "companies" WHERE "name" = 'LinkedIn'),
    '2003-01-01', '2007-02-01', 'CEO and Chairman'
);

