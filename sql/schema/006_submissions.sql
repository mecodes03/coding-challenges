-- +goose Up

CREATE TYPE submission_status_enum AS ENUM ('pending', 'passed', 'failed');
CREATE TABLE submissions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    problem_id UUID REFERENCES problems(id) ON DELETE CASCADE,
    language language_enum NOT NULL,  
    code TEXT NOT NULL,               
    status submission_status_enum NOT NULL DEFAULT 'pending',
    execution_time FLOAT,             
    evaluation_output TEXT,           
    created_at TIMESTAMP DEFAULT NOW()
);

-- +goose Down

DROP TABLE submissions;
DROP TYPE IF EXISTS submission_status_enum;
