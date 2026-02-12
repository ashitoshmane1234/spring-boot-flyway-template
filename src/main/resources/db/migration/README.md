
---

# **2️⃣ Migration-level README (`src/main/resources/db/migration/README.md`)**

```markdown
# Flyway Migrations - Rules & Guidelines

> **Purpose:** Migration-specific guide — rules, folder structure, versioning, constraints, and workflow for Flyway.

This folder contains **all Flyway migrations** for the project.

---

## Folder Structure

```text
common/        # Core schema migrations (always applied)
dev/           # Dev-only seed or test data (never in prod)
prod/          # Production-only scripts (guardrails, fixes)
repeatable/    # Views, functions, permissions (run every time)

Migration Naming Rules

Versioned Migrations (V<number>__description.sql)

Increment version for every new migration

Example: V4__add_blocked_status.sql

Repeatable Migrations (R__description.sql)

Automatically re-applied each time

Example: R__views.sql

Versioning Strategy
Version Range	Purpose
1 – 99	Core schema
100 – 799	Dev data / feature migrations
900+	Production hotfix / guardrails
Environment Guidelines
Folder	Run in profile
common	all
dev	dev only
prod	prod only
repeatable	all
Writing Migrations

Constraints first, then data changes

Use IF NOT EXISTS for tables, indexes

Always add comments

Test locally before pushing

Never modify an already applied migration

Safety Guidelines

clean-disabled=true in production

validate-on-migrate=true ensures checksums match

Optional guard for dev scripts:

DO $$
BEGIN
  IF current_setting('spring.profiles.active', true) = 'prod' THEN
    RAISE EXCEPTION 'Dev migration running in prod!';
  END IF;
END $$;


Repeatable migrations are for objects that can be safely recreated

Recommended Workflow

Create new migration in the correct folder

Test on local profile first

Push and run on dev environment

Merge after successful test

Deploy to prod via CI/CD


---

✅ **Summary**

- **First README:** `/README.md` → Project-level, overall guide, setup, profiles, usage  
- **Second README:** `/src/main/resources/db/migration/README.md` → Migration-level, Flyway rules, versioning, workflow  

---

If you want, I can also **prepare a fully ready skeleton repo** with **all folders, sample migrations V1–V5, and these two READMEs**, so your team can start immediately.  

Do you want me to do that next?