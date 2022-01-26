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

SELECT animals.name FROM animals JOIN owners ON animals.owners_id = owners.id
    WHERE owners.full_name = 'Melody Pond';

SELECT animals.* FROM animals JOIN species ON animals.species_id = species.id
    WHERE species.name = 'pokemon';

SELECT owners.full_name, animals.name FROM owners
    LEFT JOIN animals ON animals.owners_id = owners.id;

SELECT count(species.id), species.name FROM animals
    JOIN  species ON animals.species_id = species.id
    GROUP BY species.id;

SELECT a.name as name, s.name as species FROM animals as a
    JOIN owners as o ON a.owners_id = o.id
    JOIN species as s ON a.species_id = s.id
        WHERE s.name = 'digimon' AND o.full_name = 'Jennifer Orwell';

SELECT a.* FROM animals as a JOIN owners as o ON a.owners_id = o.id
    WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

SELECT o.full_name, count(o.id) as number_of_animals
    FROM owners as o JOIN animals as a ON o.id = a.owners_id
    GROUP BY o.full_name ORDER BY number_of_animals DESC LIMIT 1;
