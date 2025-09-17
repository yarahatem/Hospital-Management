-- 1. Create the database
CREATE DATABASE IF NOT EXISTS HospitalManagment;

-- 2. Create Tables

-- Treatment Table
CREATE TABLE Treatment (
    treatmentId SERIAL PRIMARY KEY,
    treatmentName VARCHAR(100) NOT NULL,
    tPrice NUMERIC(10,2) NOT NULL
);

-- Patient Table
CREATE TABLE Patient (
    patientId SERIAL PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    description TEXT,
    age INT,
    gender VARCHAR(10),
    phoneNum VARCHAR(20),
    disease VARCHAR(100),
    treatmentId INT,
    CONSTRAINT fk_treatment FOREIGN KEY (treatmentId) REFERENCES Treatment(treatmentId)
);

-- Doctor Table
CREATE TABLE Doctor (
    drId SERIAL PRIMARY KEY,
    patientId INT,
    drFirstName VARCHAR(50),
    drLastName VARCHAR(50),
    CONSTRAINT fk_patient FOREIGN KEY (patientId) REFERENCES Patient(patientId)
);

-- Hospital Table
CREATE TABLE Hospital (
    roomNum SERIAL PRIMARY KEY,
    type VARCHAR(50),
    rPrice NUMERIC(10,2),
    days INT,
    patientId INT,
    CONSTRAINT fk_patient_hospital FOREIGN KEY (patientId) REFERENCES Patient(patientId)
);

-- Workers Table
CREATE TABLE Workers (
    workerId SERIAL PRIMARY KEY,
    type VARCHAR(50),
    roomNum INT,
    workerFirstName VARCHAR(50),
    workerLastName VARCHAR(50),
    CONSTRAINT fk_room FOREIGN KEY (roomNum) REFERENCES Hospital(roomNum)
);


-- 3. Create Bill View

-- This calculates bills dynamically based on Hospital & Treatment
-- No need to store bills directly

CREATE OR REPLACE VIEW PatientBill AS
SELECT 
    p.patientId,
    p.firstName,
    p.lastName,
    COALESCE(h.rPrice * h.days, 0) + COALESCE(t.tPrice, 0) AS totalBill
FROM Patient p
LEFT JOIN Hospital h ON p.patientId = h.patientId
LEFT JOIN Treatment t ON p.treatmentId = t.treatmentId;
