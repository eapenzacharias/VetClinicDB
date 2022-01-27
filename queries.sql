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

SELECT a.name last_animal_seen, vn.name vets_name, v.date_of_visit FROM visits v
    JOIN animals a ON a.id = v.animals_id
    JOIN vets vn ON vn.id = v.vets_id
        WHERE vn.name = 'William Tatcher'
    ORDER BY v.date_of_visit DESC LIMIT 1;

SELECT COUNT(DISTINCT a.name) FROM animals as a JOIN visits v ON a.id = v.animals_id
    JOIN vets ON v.vets_id = vets.id WHERE vets.name = 'Maisy Smith';

SELECT vets.name, s.name FROM vets
LEFT JOIN specializations sp ON sp.vets_id = vets.id
LEFT JOIN species s ON s.id = sp.species_id;

SELECT a.name animal_name, v.date_of_visit FROM animals a
    JOIN visits v ON v.animals_id = a.id
    JOIN vets ON vets.id = v.vets_id
    WHERE vets.name = 'Stephanie Mendez'
        AND v.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT a.name animal_name, count(a.name) number_of_visits FROM animals a
    JOIN visits v ON v.animals_id = a.id
    GROUP BY a.name ORDER BY number_of_visits DESC LIMIT 1;

SELECT vets.name vet_name, a.name first_visit, v.date_of_visit FROM animals a
    JOIN visits v ON v.animals_id = a.id
    JOIN vets ON vets.id = v.vets_id
    WHERE vets.name = 'Maisy Smith'
    ORDER BY v.date_of_visit LIMIT 1;

SELECT a.name animal_name, a.date_of_birth, a.escape_attempts, a.neutered,
    a.weight_kg, ve.name vet_name, ve.age vet_age, ve.date_of_graduation, v.date_of_visit
    FROM animals a
    JOIN visits v ON v.animals_id = a.id
    JOIN vets ve ON ve.id = v.vets_id
    ORDER BY v.date_of_visit DESC LIMIT 1;

SELECT ve.name vet_name, count(v.animals_id) number_of_visits FROM vets ve
    LEFT JOIN visits v ON v.vets_id = ve.id
    LEFT JOIN specializations s ON s.vets_id = ve.id
    WHERE s.species_id IS NULL GROUP BY ve.name;

SELECT COUNT(vi.date_of_visit) FROM animals a
    LEFT JOIN visits vi ON a.id = vi.animals_id
    JOIN vets ON vi.vets_id = vets.id
    JOIN specializations sp ON vets.id = sp.vets_id
    JOIN species  ON sp.species_id = species.id
    WHERE sp.species_id != a.species_id;

SELECT  count(s.name) visits, s.name species_type FROM visits v
    JOIN animals a ON a.id = v.animals_id
    JOIN species s ON s.id = a.species_id
    JOIN vets ON vets.id = v.vets_id
    WHERE vets.name = 'Maisy Smith' GROUP BY s.name LIMIT 1;
