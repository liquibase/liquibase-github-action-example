# 🚨 DEPRECATED EXAMPLE - DO NOT USE

**⚠️ This example repository for the deprecated liquibase-github-action is no longer maintained.**

## Use the New Official Action Instead

**This example is for a deprecated action. Use the new setup-liquibase action:**

```yaml
- uses: liquibase/setup-liquibase@v1
  with:
    version: '4.32.0'  # or latest
    edition: 'oss'     # or 'pro'
- run: liquibase update --changelog-file=example/changelogs/samplechangelog.h2.sql
```

## Modern Example

**✅ Updated workflow using setup-liquibase@v1:**

```yaml
name: Liquibase CI
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:13
        env:
          POSTGRES_PASSWORD: liquibase
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
        ports:
          - 5432:5432
    
    steps:
    - uses: actions/checkout@v3
    - uses: liquibase/setup-liquibase@v1
      with:
        version: '4.32.0'
    
    - name: Run Liquibase Update
      run: |
        liquibase update \
          --changelog-file=changelog.xml \
          --url=jdbc:postgresql://localhost:5432/postgres \
          --username=postgres \
          --password=liquibase
```

## Migration Resources

- 📖 [Setup Liquibase Action Documentation](https://github.com/liquibase/setup-liquibase)
- 🚀 [Migration Examples](https://github.com/liquibase/setup-liquibase#migration-from-legacy-actions)
- 💡 [Best Practices](https://docs.liquibase.com/workflows/home.html)

---

**This repository has been archived. Use [liquibase/setup-liquibase](https://github.com/liquibase/setup-liquibase) for current examples.**
EOF < /dev/null