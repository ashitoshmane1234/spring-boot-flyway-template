--V100__dev_seed_users.sql
-- DEV ONLY DATA
INSERT INTO users (uuid, name, entity_status, is_active, created_at, updated_at)
VALUES
('dev-uuid-1', 'Dev User 1', 'ACTIVE', true, now(), now()),
('dev-uuid-2', 'Dev User 2', 'BLOCKED', false, now(), now())
ON CONFLICT (uuid) DO NOTHING;