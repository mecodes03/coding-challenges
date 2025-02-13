-- name: CreateProfile :one
INSERT INTO profile (
    user_id, 
    display_name, 
    image_id, 
    image, 
    bio
)
VALUES ($1, $2, $3, $4, $5)
RETURNING *;

-- name: GetProfileByUserId :one
SELECT * FROM profile
WHERE user_id = $1;

-- name: UpdateProfile :one
UPDATE profile
SET 
    display_name = COALESCE($2, display_name),
    image_id = COALESCE($3, image_id),
    image = COALESCE($4, image),
    bio = COALESCE($5, bio)
WHERE user_id = $1
RETURNING *;

-- name: DeleteProfile :exec
DELETE FROM profile
WHERE user_id = $1;
