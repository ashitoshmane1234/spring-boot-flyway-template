--V4__add_indexes.sql
-- Add indexes to improve query performance
CREATE INDEX IF NOT EXISTS idx_users_entity_status
ON users (entity_status);

CREATE INDEX IF NOT EXISTS idx_users_is_active
ON users (is_active);