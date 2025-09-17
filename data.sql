# Query: 
# Flags: RegExp
# ContextLines: 1

-- Insert Fake Data

-- Insert Treatments
INSERT INTO Treatment (treatmentName, tPrice) VALUES
('Chemotherapy', 5000.00),
('Radiation Therapy', 4000.00),
('Physical Therapy', 1500.00),
('Surgery', 10000.00),
('Medication Plan', 800.00);

-- Insert Patients
INSERT INTO Patient (firstName, lastName, description, age, gender, phoneNum, disease, treatmentId) VALUES
('Ali', 'Hassan', 'Patient with cancer', 45, 'Male', '01012345678', 'Lung Cancer', 1),
('Sara', 'Mahmoud', 'Recovering after surgery', 32, 'Female', '01098765432', 'Appendicitis', 4),
('Omar', 'Khaled', 'Needs regular therapy', 28, 'Male', '01123456789', 'Back Pain', 3),
('Laila', 'Fouad', 'On medication plan', 50, 'Female', '01234567890', 'Hypertension', 5),
('Hany', 'Adel', 'Under radiation treatment', 60, 'Male', '01011223344', 'Skin Cancer', 2);

-- Insert Doctors
INSERT INTO Doctor (patientId, drFirstName, drLastName) VALUES
(1, 'Mohamed', 'Youssef'),
(2, 'Nour', 'Samir'),
(3, 'Ahmed', 'Kamel'),
(4, 'Mona', 'Hassan'),
(5, 'Karim', 'Lotfy');

-- Insert Hospital Rooms
INSERT INTO Hospital (type, rPrice, days, patientId) VALUES
('ICU', 2000.00, 10, 1),
('General Ward', 500.00, 5, 2),
('Physiotherapy', 300.00, 15, 3),
('Private Room', 1000.00, 7, 4),
('ICU', 2000.00, 12, 5);

-- Insert Workers
INSERT INTO Workers (type, roomNum, workerFirstName, workerLastName) VALUES
('Nurse', 1, 'Heba', 'Omar'),
('Cleaner', 1, 'Samir', 'Ali'),
('Nurse', 2, 'Reem', 'Adel'),
('Physiotherapist', 3, 'Yara', 'Fathy'),
('Nurse', 4, 'Salma', 'Tarek'),
('Cleaner', 5, 'Othman', 'Hassan');