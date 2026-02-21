CREATE TABLE doctors (
  doctor_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL CHECK (length(name) >= 3),
  age INT NOT NULL CHECK (age BETWEEN 23 AND 75),
  gender VARCHAR(10) NOT NULL 
    CHECK (gender IN ('Male', 'Female', 'Other')),
  specialization VARCHAR(50) NOT NULL,
  contact BIGINT NOT NULL UNIQUE 
    CHECK (contact BETWEEN 6000000000 AND 9999999999)
);

ALTER TABLE doctors
DROP CONSTRAINT doctors_experience_check;

CREATE TABLE IF NOT EXISTS patients (
  patient_id SERIAL PRIMARY KEY,

  username VARCHAR(30) NOT NULL UNIQUE
    CHECK (length(username) >= 5),

  name TEXT NOT NULL 
    CHECK (length(name) >= 3),

  age INT NOT NULL 
    CHECK (age BETWEEN 0 AND 120),

  weight NUMERIC(5,2) NOT NULL 
    CHECK (weight BETWEEN 1 AND 300),

  gender VARCHAR(10) NOT NULL
    CHECK (gender IN ('Male', 'Female', 'Other'))
);

CREATE TABLE IF NOT EXISTS reception (
  reception_id SERIAL PRIMARY KEY,

  email VARCHAR(100) NOT NULL UNIQUE
    CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),

  name TEXT NOT NULL
    CHECK (length(name) >= 3),

  contact BIGINT NOT NULL UNIQUE
    CHECK (contact BETWEEN 6000000000 AND 9999999999),

  gender VARCHAR(10) NOT NULL
    CHECK (gender IN ('Male', 'Female', 'Other')),

  age INT NOT NULL
    CHECK (age BETWEEN 18 AND 60)
);
