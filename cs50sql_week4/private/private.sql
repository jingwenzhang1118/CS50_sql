CREATE TABLE "numbers" (
    "id" INTEGER PRIMARY KEY,
    "num1" INTEGER,
    "num2" INTEGER,
    "num3" INTEGER
);

INSERT INTO "numbers" ("num1", "num2", "num3")
VALUES
    ('14', '98', '4'),
    ('114', '3', '5'),
    ('618', '72', '9'),
    ('630', '7', '3'),
    ('932', '12', '5'),
    ('2230', '50', '7'),
    ('2346', '44', '10'),
    ('3041', '14', '5');
y
CREATE TABLE "texts" AS
SELECT "numbers".*, "sentences"."sentence" FROM "numbers", "sentences"
WHERE "numbers"."num1" = "sentences"."id";

ALTER TABLE "texts"
ADD COLUMN "phrase" TEXT;
UPDATE "texts" SET "phrase" = substr("sentence", "num2", "num3");

CREATE VIEW "message" AS
SELECT "phrase" FROM "texts";