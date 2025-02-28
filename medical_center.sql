CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name text   NOT NULL,
    last_name text   NOT NULL,
    current_employee bool   NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name text   NOT NULL,
    last_name text   NOT NULL,
    date_birth timestamp   NOT NULL
);

CREATE TABLE doctor_patient_relationships (
    id SERIAL PRIMARY KEY,
    patient_id int   NOT NULL REFERENCES patients,
    doctor_id int   NOT NULL REFERENCES doctors
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name text   NOT NULL
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    patient_id int   NOT NULL REFERENCES patients,
    disease_id int   NOT NULL REFERENCES diseases,
    diagnosed_by_id int   NOT NULL REFERENCES doctors
);

CREATE INDEX patients_index ON patients(first_name, last_name);
CREATE INDEX doctors_index ON doctors(first_name, last_name);
CREATE INDEX diseases_index ON diseases(name);