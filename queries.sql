SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE
      date_of_birth >= '2016-01-01'
  and date_of_birth <= '2019-12-31';

SELECT name FROM animals WHERE
        neutered = 'true'
    and escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE
       name = 'Agumon'
    or name = 'Pikachu';

SELECT name, escape_attempts FROM animals WHERE
    weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = 'true';

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE
      weight_kg >= 10.4
  and weight_kg <= 17.3;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals where escape_attempts = 0;

SELECT AVG(weight_kg) FROM animalsl;

SELECT neutered, MAX(escape_attempts) as escape_attempts FROM animals GROUP BY neutered;

SELECT species, min(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT AVG(escape_attempts) as avg_escape_attempts FROM animals
where date_of_birth BETWEEN '1990-01-01' AND '2000-01-01';
