--V2__update_entity_status_constraint.sql
-- Drop old constraint if exists
ALTER TABLE users
DROP CONSTRAINT IF EXISTS chk_entity_status;

-- Add updated constraint
ALTER TABLE users
ADD CONSTRAINT chk_entity_status
CHECK (
  entity_status IN (
    'ACTIVE',
    'SUSPENDED',
    'DELETED',
    'INACTIVE'
  )
);
