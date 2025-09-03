SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Appointments;
SELECT * FROM Medical_Records;
SELECT * FROM Payments;

SELECT a.appointment_id, p.name AS patient_name, d.name AS doctor_name, a.appointment_date, a.status
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;

SELECT * FROM Medical_Records
WHERE patient_id = 1;

SELECT SUM(amount) AS total_payments FROM Payments;

SELECT a.appointment_id, p.name AS patient_name, d.name AS doctor_name, a.appointment_date
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
WHERE a.appointment_date >= CURDATE();

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status)
VALUES (3, 2, '2025-09-10', 'Scheduled');

UPDATE Appointments
SET status = 'Completed'
WHERE appointment_id = 1;

DELETE FROM Payments
WHERE payment_id = 2;

SELECT p.name AS patient_name, MAX(a.appointment_date) AS last_appointment
FROM Patients p
LEFT JOIN Appointments a ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.name;

SELECT d.name AS doctor_name, COUNT(a.appointment_id) AS total_appointments
FROM Doctors d
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.name;

SELECT p.name AS patient_name, SUM(pay.amount) AS total_paid
FROM Patients p
LEFT JOIN Payments pay ON p.patient_id = pay.patient_id
GROUP BY p.patient_id, p.name;

SELECT p.name AS patient_name, d.name AS doctor_name, m.diagnosis, m.treatment
FROM Patients p
JOIN Medical_Records m ON p.patient_id = m.patient_id
JOIN Appointments a ON p.patient_id = a.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;

SELECT a.appointment_id, p.name AS patient_name, d.name AS doctor_name, a.appointment_date
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
WHERE a.appointment_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY);

SELECT p.name AS patient_name
FROM Patients p
LEFT JOIN Appointments a ON p.patient_id = a.patient_id
WHERE a.appointment_id IS NULL;

