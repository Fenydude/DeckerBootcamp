CREATE TABLE IF NOT EXISTS sample_table (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
    );

INSERT INTO sample_table (name) VALUES ('Sample Data 1'), ('Sample Data 2'), ('Sample Data 3');
