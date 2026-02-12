# Flyway POC - Spring Boot Project

This is a **POC project** demonstrating an enterprise-ready Flyway + Spring Boot setup.  
It includes schema versioning, environment-specific migrations, and repeatable scripts.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Folder Structure](#folder-structure)
- [Profiles & Environments](#profiles--environments)
- [Database Setup](#database-setup)
- [Running the Application](#running-the-application)
- [Flyway Migrations](#flyway-migrations)
- [Adding New Migrations](#adding-new-migrations)
- [Best Practices](#best-practices)
- [CI/CD](#cicd)

---

## Project Overview

- **Spring Boot** 4.x  
- **PostgreSQL** database  
- **Hibernate** for JPA mapping  
- **Flyway** for database versioning  
- Environment-specific migrations: `local`, `dev`, `prod`  
- Repeatable migrations for views, functions, and permissions

---

## Folder Structure

```text
src/main/resources/db/migration/
├── README.md                   # Migration-level README
├── common/                     # Core schema migrations
├── dev/                        # Dev-only migrations
├── prod/                       # Prod-only migrations
└── repeatable/                 # Views, functions, grants (run every time)

Profiles & Environments
Profile	DB URL	Flyway folders applied
local	Local DB	common + repeatable
dev	Dev DB	common + dev + repeatable
prod	Prod DB	common + prod + repeatable

Set the profile when running the app:

# Local
./mvnw spring-boot:run

# Dev
./mvnw spring-boot:run -Dspring-boot.run.profiles=dev

# Prod
java -jar target/flywaypoc.jar --spring.profiles.active=prod

Database Setup

PostgreSQL recommended

Ensure the database exists:

createdb flyway_poc


Flyway will automatically create the schema history table (flyway_schema_history).

Running the Application

Clone the repository

Ensure application.properties or environment variables are set:

DB_URL=jdbc:postgresql://localhost:5432/flyway_poc
DB_USERNAME=postgres
DB_PASSWORD=newpassword


Run Spring Boot with the desired profile (default = local):

./mvnw spring-boot:run


Flyway will automatically run migrations for the active profile.

Flyway Migrations

common/ → Core schema changes

dev/ → Dev-only seed/test data

prod/ → Production-only scripts or guardrails

repeatable/ → Views, functions, grants

Migration naming convention:

V<version>__<description>.sql   # Versioned migrations
R__<description>.sql            # Repeatable migrations


Example: V4__add_blocked_status.sql, R__views.sql

Adding New Migrations

Increment the version number (V5, V6...)

Add migration to the correct folder (common, dev, prod)

Ensure constraints and schema updates happen before data backfills

Add comments in SQL

Test on local profile first

Best Practices

Never edit already applied migrations

Validate migration locally before pushing

Use environment-specific folders for safety

Use repeatable migrations for views/functions

Lock Hibernate to ddl-auto=none in production

Enforce database constraints before updating data

CI/CD Recommendations

Run migrations on a fresh DB in CI

Fail the build if Flyway validation fails

Use environment variables to inject DB credentials

Protect production DB with 
clean-disabled=true