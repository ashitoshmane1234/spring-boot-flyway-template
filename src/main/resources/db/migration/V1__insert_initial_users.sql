-- V1__insert_initial_users.sql
-- Insert 5 initial users into the users table

INSERT INTO users (name, entity_status, created_at, updated_at, is_active)
VALUES
    ('Alice Johnson', 'ACTIVE', NOW(), NOW(), TRUE),
    ('Bob Smith', 'ACTIVE', NOW(), NOW(), TRUE),
    ('Charlie Brown', 'SUSPENDED', NOW(), NOW(), FALSE),
    ('Diana Prince', 'ACTIVE', NOW(), NOW(), TRUE),
    ('Ethan Hunt', 'DELETED', NOW(), NOW(), FALSE);