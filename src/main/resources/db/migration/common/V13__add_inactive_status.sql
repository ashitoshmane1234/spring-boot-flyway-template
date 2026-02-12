
-- 2. Update existing rows where status is BLOCKED to INACTIVE
UPDATE users
SET entity_status = 'INACTIVE'
WHERE entity_status = 'BLOCKED';
