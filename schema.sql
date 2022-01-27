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

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    age INT NOT NULL
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owners_id INT;
ALTER TABLE animals ADD FOREIGN KEY (owners_id) REFERENCES owners(id);

CREATE TABLE vets (
    id  SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE
);

CREATE TABLE specializations (
  species_id INT NOT NULL,
  vets_id INT NOT NULL,
  CONSTRAINT specializations_pk PRIMARY KEY (species_id, vets_id),
  CONSTRAINT fk_species
      FOREIGN KEY(species_id) REFERENCES species(id),
  CONSTRAINT fk_vets
      FOREIGN KEY(vets_id) REFERENCES vets(id)
);

CREATE TABLE visits (
    animals_id INT NOT NULL,
    vets_id INT NOT NULL,
    date_of_visit DATE NOT NULL,
    CONSTRAINT visits_pk PRIMARY KEY (animals_id, vets_id, date_of_visit),
    CONSTRAINT fk_animals
      FOREIGN KEY(animals_id) REFERENCES animals(id),
    CONSTRAINT fk_vets_visits
        FOREIGN KEY(vets_id) REFERENCES vets(id)
);
