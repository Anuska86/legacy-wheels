SELECT \* FROM users WHERE username = ' [INPUT] ' AND password = ' [INPUT] '

The Attack
Instead of a username, an attacker enters: ' OR '1'='1

The final query sent to the database becomes: SELECT \* FROM users WHERE username = '' OR '1'='1' --' AND password = '...'

Why this is a problem:
'1'='1' is always true.

The -- is a comment symbol in SQL, which tells the database to ignore the rest of the line (like the password check).

The database sees "Log in if the name is blank OR if 1 equals 1." Since 1 always equals 1, the database grants access to the first user in the list—usually the Administrator.

Method,How it Works

Prepared Statements,"The query structure is sent to the database first, and the ""user input"" is sent later as data only, never as code."

Input Validation,"Only allowing specific characters (e.g., a username can't contain semicolons or quotes)."

Principle of Least Privilege,"Giving the database user only the bare minimum permissions (e.g., ""Read-only"" so they can't delete tables)."
