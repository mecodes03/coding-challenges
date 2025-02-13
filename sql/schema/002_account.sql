-- +goose Up

CREATE TYPE account_type AS ENUM ('github', 'google', 'email');

CREATE TABLE account (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    account_type account_type NOT NULL,
    github_id TEXT UNIQUE,
    google_id TEXT UNIQUE,
    password TEXT,
    salt TEXT
);

CREATE INDEX user_id_account_type_idx ON account (user_id, account_type);


-- +goose Down

DROP TABLE IF EXISTS account;
DROP INDEX IF EXISTS user_id_account_type_idx;
DROP TYPE IF EXISTS account_type;


