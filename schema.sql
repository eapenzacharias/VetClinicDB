CREATE TABLE animals (
  id INT NOT NULL,
  name VARCHAR(100),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg decimal,
  PRIMARY KEY(id)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(100);