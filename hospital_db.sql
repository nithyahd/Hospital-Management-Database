USE hospital_db;

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    specialty VARCHAR(100),
    contact VARCHAR(15)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Medical_Records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    diagnosis VARCHAR(255),
    treatment VARCHAR(255),
    prescription_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Insert sample patients
INSERT INTO Patients (name, age, gender, contact, address)
VALUES 
('Aishwarya', 21, 'Female', '7483813305', 'Bangalore'),
('Rohit Kumar', 25, 'Male', '9876543210', 'Delhi'),
('Ananya Sharma', 30, 'Female', '9123456780', 'Mumbai');

-- Insert sample doctors
INSERT INTO Doctors (name, specialty, contact)
VALUES 
('Dr. Arjun Rao', 'Cardiologist', '9001234567'),
('Dr. Meera Singh', 'Dermatologist', '9012345678');

-- Insert sample appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status)
VALUES
(1, 1, '2025-09-05', 'Scheduled'),
(2, 2, '2025-09-06', 'Completed'),
(3, 1, '2025-09-07', 'Scheduled');

-- Insert sample medical records
INSERT INTO Medical_Records (patient_id, diagnosis, treatment, prescription_date)
VALUES
(1, 'High Blood Pressure', 'Medication A', '2025-09-05'),
(2, 'Acne', 'Cream B', '2025-09-06');

-- Insert sample payments
INSERT INTO Payments (patient_id, amount, payment_date, payment_method)
VALUES
(1, 500.00, '2025-09-05', 'Cash'),
(2, 750.00, '2025-09-06', 'Credit Card');
