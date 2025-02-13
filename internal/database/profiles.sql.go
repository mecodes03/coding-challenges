// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.27.0
// source: profiles.sql

package database

import (
	"context"
	"database/sql"
)

const createProfile = `-- name: CreateProfile :one
INSERT INTO profile (
    user_id, 
    display_name, 
    image_id, 
    image, 
    bio
)
VALUES ($1, $2, $3, $4, $5)
RETURNING id, user_id, display_name, image_id, image, bio
`

type CreateProfileParams struct {
	UserID      int32
	DisplayName sql.NullString
	ImageID     sql.NullString
	Image       sql.NullString
	Bio         string
}

func (q *Queries) CreateProfile(ctx context.Context, arg CreateProfileParams) (Profile, error) {
	row := q.db.QueryRowContext(ctx, createProfile,
		arg.UserID,
		arg.DisplayName,
		arg.ImageID,
		arg.Image,
		arg.Bio,
	)
	var i Profile
	err := row.Scan(
		&i.ID,
		&i.UserID,
		&i.DisplayName,
		&i.ImageID,
		&i.Image,
		&i.Bio,
	)
	return i, err
}

const deleteProfile = `-- name: DeleteProfile :exec
DELETE FROM profile
WHERE user_id = $1
`

func (q *Queries) DeleteProfile(ctx context.Context, userID int32) error {
	_, err := q.db.ExecContext(ctx, deleteProfile, userID)
	return err
}

const getProfileByUserId = `-- name: GetProfileByUserId :one
SELECT id, user_id, display_name, image_id, image, bio FROM profile
WHERE user_id = $1
`

func (q *Queries) GetProfileByUserId(ctx context.Context, userID int32) (Profile, error) {
	row := q.db.QueryRowContext(ctx, getProfileByUserId, userID)
	var i Profile
	err := row.Scan(
		&i.ID,
		&i.UserID,
		&i.DisplayName,
		&i.ImageID,
		&i.Image,
		&i.Bio,
	)
	return i, err
}

const updateProfile = `-- name: UpdateProfile :one
UPDATE profile
SET 
    display_name = COALESCE($2, display_name),
    image_id = COALESCE($3, image_id),
    image = COALESCE($4, image),
    bio = COALESCE($5, bio)
WHERE user_id = $1
RETURNING id, user_id, display_name, image_id, image, bio
`

type UpdateProfileParams struct {
	UserID      int32
	DisplayName sql.NullString
	ImageID     sql.NullString
	Image       sql.NullString
	Bio         string
}

func (q *Queries) UpdateProfile(ctx context.Context, arg UpdateProfileParams) (Profile, error) {
	row := q.db.QueryRowContext(ctx, updateProfile,
		arg.UserID,
		arg.DisplayName,
		arg.ImageID,
		arg.Image,
		arg.Bio,
	)
	var i Profile
	err := row.Scan(
		&i.ID,
		&i.UserID,
		&i.DisplayName,
		&i.ImageID,
		&i.Image,
		&i.Bio,
	)
	return i, err
}
