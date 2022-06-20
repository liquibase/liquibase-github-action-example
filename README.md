[![.github/workflows/example.yml](https://github.com/liquibase/liquibase-github-action-example/actions/workflows/example.yml/badge.svg)](https://github.com/liquibase/liquibase-github-action-example/actions/workflows/example.yml)

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
    name varchar(50) not null
)
```
4. Add the the database username, password and url to your [GitHub Secrets](https://docs.github.com/en/actions/reference/encrypted-secrets).  The values to use are in `example/changelogs/configurationValues.txt`

5. Add, commit and push your changes to GitHub.
```bash
git add example/changelogs/samplechangelog.h2.sql
git commit -m "yourname: Adding new changeset for example"
git push origin <your_branch_name>
```
6. Your commit triggers a build in GitHub and executes Liquibase update!

 `https://github.com/<YOURFORK>/liquibase-github-action-example/actions`
 

 If you want to try with your own changelog and database, you can make a pull request against this repository with your desired operation, changeLogFile, database username, database password, and database jdbc url.

# Additional Examples
 In addition to the default Docker-based example included in the "example" folder this repository also contains additional examples in the "extra" folder.
 These pertain to various non-Docker build systems such as Gradle, NodeJS and Maven, and also showcase a second Docker example that doesn't use the official Liquibase action. While the official GitHub Action is the preferred way of implementing Docker-based workflows, there may be use-cases requiring custom container images from custom registries. The extra Docker example illustrates how this can be done.

 Corresponding GitHub Action workflow (.yml) files for all extra examples can be found in the .github/workflows directory and they must be explicitly enabled for testing.

 # Troubleshooting
 * If your build fails due to a validation error, verify that your changeset author and ID are unique in the changelog. This is the `changeset yourname:yourname1`, where the left side is your author and the right is the changeset ID.
 * If Liquibase Update fails, verify that your table name is unique in the changelog.

# Get More Liquibase!
Get documentation at https://docs.liquibase.com      
Get certified courses at https://learn.liquibase.com  
Get support at https://liquibase.com/support         


Copyright 2021 Liquibase Inc. All rights reserved. Liquibase is a registered trademark of Liquibase Inc. The program is subject to the 
license agreement, copyright, trademark, patent, and other laws.
