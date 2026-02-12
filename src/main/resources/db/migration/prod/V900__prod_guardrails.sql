--V900__prod_guardrails.sql
-- Prevent accidental deletes in prod
REVOKE DELETE ON users FROM PUBLIC;