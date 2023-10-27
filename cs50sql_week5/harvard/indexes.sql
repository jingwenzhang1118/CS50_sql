CREATE INDEX "student_index" ON "enrollments" ("student_id");
CREATE INDEX "course_index" ON "enrollments" ("course_id");
CREATE INDEX "course_semester_index" ON "courses" ("semester");
CREATE INDEX "course_id_index" ON "satisfies" ("course_id");
CREATE INDEX "course_sem_title" ON "courses" ("title", "semester"); -- optional
/*
CREATE INDEX "course_index" ON "enrollments" ("course_id");
This index is not helpful in the following query
SELECT "courses"."title", "courses"."semester"
FROM "enrollments"
JOIN "courses" ON "enrollments"."course_id" = "courses"."id"
JOIN "students" ON "enrollments"."student_id" = "students"."id"
WHERE "students"."id" = 3;

Focus on the where clause. It uses student id here, therefore "course_index" does not help much."*/



/* The following indices do not help much in the following query.
CREATE INDEX "course_dep_index" ON "courses" ("department");
CREATE INDEX "course_num_index" ON "courses" ("number");
CREATE INDEX "course_semester_index" ON "courses" ("semester");

SELECT "id", "name"
FROM "students"
WHERE "id" IN (
    SELECT "student_id"
    FROM "enrollments"
    WHERE "course_id" = (
        SELECT "id"
        FROM "courses"
        WHERE "courses"."department" = 'Computer Science'
        AND "courses"."number" = 50
        AND "courses"."semester" = 'Fall 2023'
    )
);*/



/* The following index does not help much in the following query.
CREATE INDEX "course_title_index" ON "courses" ("title");
SELECT "department", "number", "title"
FROM "courses"
WHERE "title" LIKE "History%"
AND "semester" = 'Fall 2023';*/
