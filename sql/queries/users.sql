-- name: CreateUser :one
INSERT INTO users (email, email_verified)
VALUES ($1, $2)
RETURNING id, email, email_verified;

-- name: GetUserByID :one
SELECT * FROM users
WHERE id = $1;

-- name: GetUserByEmail :one
SELECT * FROM users
WHERE email = $1;

-- name: UpdateUserEmailVerification :one
UPDATE users
SET email_verified = $2
WHERE id = $1
RETURNING *;

-- name: DeleteUser :exec
DELETE FROM users
WHERE id = $1;
