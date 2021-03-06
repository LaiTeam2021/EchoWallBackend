CREATE TABLE IF NOT EXISTS users(
  id BIGSERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  create_date TIMESTAMP NOT NULL DEFAULT NOW(),
  is_active BOOLEAN DEFAULT True
);

CREATE TABLE IF NOT EXISTS whitelist (
  user_id BIGINT UNIQUE REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS gender_type(
  id SERIAL PRIMARY KEY,
  gender VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS profile (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT UNIQUE REFERENCES users(id),
  avatar_url VARCHAR(512),
  gender int REFERENCES gender_type(id),
  residence TEXT DEFAULT 'Mars',
  dob DATE,
  about_me TEXT
);

CREATE TABLE IF NOT EXISTS follow (
    user_id BIGINT UNIQUE REFERENCES users (id),
    follow_id BIGINT UNIQUE REFERENCES users (id),
    create_date DATE
);

