INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8.00);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (4, 'Devimon', '2017-05-12', 5, true, 11.00);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (5,'Charmander', '2020-02-08', 0, false, -11.00);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (6,'Plantmon', '2022-11-15', 2, true, -5.7);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (7,'Squirtle', '1993-04-02', 3, false, -12.13);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (8,'Angemon', '2005-06-12', 1, false, -45.00);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (9,'Boarmon', '2005-06-07', 1, true, 20.40);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (10,'Blossom', '1998-10-13', 3, true, 17.00);

BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
END TRANSACTION;

BEGIN TRANSACTION;
DELETE  FROM animals;
ROLLBACK;

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT animals_one;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT animals_one;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
END TRANSACTION;
