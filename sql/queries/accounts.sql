-- name: CreateAccount :one
INSERT INTO account (
    user_id, 
    account_type, 
    github_id, 
    google_id, 
    password, 
    salt
)
VALUES ($1, $2, $3, $4, $5, $6)
RETURNING *;

-- name: GetAccountByUserId :one
SELECT * FROM account
WHERE user_id = $1;

-- name: GetAccountByGithubId :one
SELECT * FROM account
WHERE github_id = $1;

-- name: GetAccountByGoogleId :one
SELECT * FROM account
WHERE google_id = $1;

-- name: UpdateAccountPassword :exec
UPDATE account
SET password = $2, salt = $3
WHERE user_id = $1;

-- name: DeleteAccount :exec
DELETE FROM account
WHERE user_id = $1;

