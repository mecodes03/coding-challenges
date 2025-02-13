-- +goose Up

CREATE TYPE problem_type_enum AS ENUM (
    'dsa', 'bug_fix', 'refactoring', 'react', 'functional', 'misc'
);

CREATE TYPE tag_enum AS ENUM (
    'array',
    'string',
    'tree',
    'graph',
    'math',
    'dp',           
    'sorting',
    'searching',
    'bug',
    'syntax',
    'logic',
    'performance',
    'refactoring',
    'clean_code',
    'optimization',
    'react',
    'component',
    'hooks',
    'state',
    'props',
    'context',
    'redux',
    'functional',
    'currying',
    'composition',
    'immutability',
    'misc'
);
CREATE TYPE difficulty_enum AS ENUM ('easy', 'medium', 'hard', 'unspecified');
CREATE TYPE language_enum AS ENUM ('javascript', 'typescript', 'python');
CREATE TABLE problems (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    problem_type problem_type_enum NOT NULL,
    difficulty difficulty_enum NOT NULL DEFAULT 'unspecified',
    language_supported language_enum[] NOT NULL,
    input_description TEXT,
    output_description TEXT,
    test_cases JSONB,           
    code_templates JSONB,          
    sample_solutions JSONB,        
    tags tag_enum[] NOT NULL,                
    creator_id INT REFERENCES users(id) ON DELETE SET NULL, 
    created_at TIMESTAMP DEFAULT NOW()
);

-- +goose Down

DROP TABLE IF EXISTS problems;
DROP TYPE IF EXISTS problem_type_enum;
DROP TYPE IF EXISTS tag_enum;
DROP TYPE IF EXISTS difficulty_enum;
DROP TYPE IF EXISTS language_enum;
