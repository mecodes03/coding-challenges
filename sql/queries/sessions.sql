-- name: CreateSession :one
INSERT INTO session (
    id, 
    user_id, 
    expires_at
)
VALUES ($1, $2, $3)
RETURNING *;

-- name: GetSessionByID :one
SELECT * FROM session
WHERE id = $1;

-- name: GetSessionsByUserId :many
SELECT * FROM session
WHERE user_id = $1;

-- name: DeleteSession :exec
DELETE FROM session
WHERE id = $1;

-- name: DeleteExpiredSessions :exec
DELETE FROM session
WHERE expires_at < NOW();
