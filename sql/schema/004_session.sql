-- +goose Up

CREATE TABLE session (
    id TEXT PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE INDEX session_user_id_idx ON session (user_id);

-- +goose Down

DROP TABLE session;
