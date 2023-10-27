from cs50 import SQL
db = SQL("sqlite:///dont-panic.db")
password = input("Enter a password: ")
db.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin'
    """,
    password
)


#View the results in python
#rows = db.execute(
#    """
#    SELECT * FROM "users"
#    WHERE "username" = 'admin';
#    """
#)
#print(rows)
#"""