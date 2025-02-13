-- name: CreateProblem :one
INSERT INTO problems (
    title, 
    description, 
    problem_type, 
    difficulty, 
    language_supported, 
    input_description, 
    output_description, 
    test_cases, 
    code_templates, 
    sample_solutions, 
    tags, 
    creator_id
)
VALUES (
    $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12
)
RETURNING 
    id, title, description, problem_type, difficulty, language_supported, 
    input_description, output_description, test_cases, code_templates, 
    sample_solutions, tags, creator_id, created_at;

-- name: GetProblemByID :one
SELECT 
    id, title, description, problem_type, difficulty, language_supported, 
    input_description, output_description, test_cases, code_templates, 
    sample_solutions, tags, creator_id, created_at
FROM problems
WHERE id = $1;

-- name: ListProblems :many
SELECT 
    id, title, description, problem_type, difficulty, language_supported, 
    input_description, output_description, test_cases, code_templates, 
    sample_solutions, tags, creator_id, created_at
FROM problems
ORDER BY created_at DESC
LIMIT $1 OFFSET $2;

-- name: ListProblemsByType :many
SELECT 
    id, title, description, problem_type, difficulty, language_supported, 
    input_description, output_description, test_cases, code_templates, 
    sample_solutions, tags, creator_id, created_at
FROM problems
WHERE problem_type = $1
ORDER BY created_at DESC
LIMIT $2 OFFSET $3;

