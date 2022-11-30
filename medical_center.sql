DROP DATABASE medical;
CREATE DATABASE medical;
\c medical

CREATE TABLE doctor (
    id SERIAL PRIMARY KEY,
    last_name TEXT NOT NULL,
    first_name TEXT NOT NULL
);

CREATE TABLE patient (
    id SERIAL PRIMARY KEY,
    last_name TEXT NOT NULL,
    first_name TEXT NOT NULL
);

CREATE TABLE medical_center (
    patient_id INTEGER REFERENCES patient ON DELETE CASCADE, 
    doctor_id INTEGER REFERENCES doctor ON DELETE CASCADE
);


CREATE TABLE diagnose (
    id SERIAL PRIMARY KEY,
    disease TEXT NOT NULL,
    patient_id INTEGER REFERENCES patient ON DELETE CASCADE

);



INSERT INTO doctor (last_name, first_name)
VALUES ('Smith', 'John'), ('William', 'Jane');

INSERT INTO patient (last_name, first_name)
VALUES ('Lopez', 'Gina'), ('Martin', 'George');

INSERT INTO diagnose (disease, patient_id)
VALUES ('flu', 1), ('headache', 1), ('fatigue', 2);