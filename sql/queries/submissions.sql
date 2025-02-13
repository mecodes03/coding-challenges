-- name: CreateSubmission :one
INSERT INTO submissions (
    user_id, 
    problem_id, 
    language, 
    code, 
    status, 
    execution_time, 
    evaluation_output
)
VALUES (
    $1, $2, $3, $4, $5, $6, $7
)
RETURNING 
    id, user_id, problem_id, language, code, status, execution_time, evaluation_output, created_at;

-- name: GetSubmissionByID :one
SELECT 
    id, user_id, problem_id, language, code, status, execution_time, evaluation_output, created_at
FROM submissions
WHERE id = $1;

-- name: ListSubmissionsByUser :many
SELECT 
    id, user_id, problem_id, language, code, status, execution_time, evaluation_output, created_at
FROM submissions
WHERE user_id = $1
ORDER BY created_at DESC
LIMIT $2 OFFSET $3;

-- name: ListSubmissionsByProblem :many
SELECT 
    id, user_id, problem_id, language, code, status, execution_time, evaluation_output, created_at
FROM submissions
WHERE problem_id = $1
ORDER BY created_at DESC
LIMIT $2 OFFSET $3;

-- name: UpdateSubmissionStatus :one
UPDATE submissions
SET 
    status = $2, 
    execution_time = $3, 
    evaluation_output = $4
WHERE id = $1
RETURNING 
    id, user_id, problem_id, language, code, status, execution_time, evaluation_output, created_at;
