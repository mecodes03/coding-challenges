-- +goose Up

CREATE TABLE profile (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL UNIQUE REFERENCES users(id) ON DELETE CASCADE,
    display_name TEXT,
    image_id TEXT,
    image TEXT,
    bio TEXT NOT NULL DEFAULT ''
);

-- +goose Down

DROP TABLE profile;
