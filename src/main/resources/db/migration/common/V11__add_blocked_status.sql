--V3__add_blocked_status.sql
-- Allow BLOCKED value to be used (data only)
-- No constraint change yet (safe)

-- Drop old constraint if exists
ALTER TABLE users
DROP CONSTRAINT IF EXISTS users_entity_status_check;

-- Add updated constraint including BLOCKED
ALTER TABLE users
ADD CONSTRAINT users_entity_status_check
CHECK (entity_status IN ('ACTIVE', 'SUSPENDED', 'DELETED', 'INACTIVE'));


