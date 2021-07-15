![.github/workflows/example.yml](https://github.com/liquibase/liquibase-github-action-example/workflows/.github/workflows/example.yml/badge.svg)

# Example Liquibase Github Action

Liquibase Github Action is the official Liquibase plugin for Github Actions. The plugin supports the most useful Liquibase commands for automation. These commands are update, updateCount, tag, updateToTag, rollback, rollbackCount, rollbackToDate, updateSQL, futureRollbackSQL, status, history and diff.

Liquibase Github Action Repository : https://github.com/liquibase/liquibase-github-action

This example directory is a way to get familiar with how Liquibase Github Action works. 

# How To Run the Example

1. Fork and clone the liquibase-github-action-example repository.
> Fork by clicking the "Fork" button at the top right of the liquibase-github-action-example page.
```bash
git clone git@github.com:<YOURFORK>/liquibase/liquibase-github-action-example.git
```
2. Create a new git branch for your changes.
```bash
git checkout -b <your_branch_name>
```
3. Edit example/changelogs/samplechangelog.h2.sql to add a new changeset. Replace "yourname" with a unique identifier.
```
--changeset yourname:yourname1
--rollback DROP TABLE yourname;
CREATE TABLE yourname (
    id int primary key,
    name varchar(50) not null,
)
```

4. Add, commit and push your changes to GitHub.
```bash
git add example/changelogs/samplechangelog.h2.sql
git commit -m "yourname: Adding new changeset for example"
git push origin <your_branch_name>
```
5. Your commit triggers a build in GitHub and executes Liquibase update!

 https://github.com/liquibase/liquibase-github-action-example/actions
 

 If you want to try with your own changelog and database, you can make a pull request against this repository with your desired operation, changeLogFile, database username, database password, and database jdbc url.

 # Troubleshooting
 * If your build fails due to a validation error, verify that your changeset author and ID are unique in the changelog. This is the `changeset yourname:yourname1`, where the left side is your author and the right is the changeset ID.
 * If Liquibase Update fails, verify that your table name is unique in the changelog.

# Get More Liquibase!
Get documentation at https://docs.liquibase.com      
Get certified courses at https://learn.liquibase.com  
Get support at https://liquibase.com/support         


Copyright 2020 Datical, Inc. All rights reserved. The program is subject to the 
license agreement, copyright, trademark, patent, and other laws.
