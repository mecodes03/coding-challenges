-- +goose Up

CREATE EXTENSION IF NOT EXISTS citext;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    email_verified TIMESTAMP WITH TIME ZONE
);

-- +goose Down
DROP TABLE users;
DROP EXTENSION IF EXISTS citext;
