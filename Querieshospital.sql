-- Hospital Operations & Patient Analysis
-- 1. What is the total number of patients in the hospital?
SELECT COUNT(*) AS total_patients
FROM Patients;

-- 2. How many patients are there in each gender?
SELECT gender,
       COUNT(*) AS patient_count
FROM Patients
GROUP BY gender;

-- 3. Which cities have the highest number of patients?
SELECT city,
       COUNT(*) AS patient_count
FROM Patients
GROUP BY city
ORDER BY patient_count DESC;

-- 4. How many doctors are working in each department?
SELECT department_id,
       COUNT(*) AS doctor_count
FROM Doctors
GROUP BY department_id
ORDER BY doctor_count DESC;

-- 5. What is the distribution of appointments by status?
SELECT status,
       COUNT(*) AS appointment_count
FROM Appointments
GROUP BY status
ORDER BY appointment_count DESC;

-- 6. What is the average treatment cost?
SELECT ROUND(AVG(treatment_cost), 2) AS average_treatment_cost
FROM Treatments;

-- 7. What is the total treatment cost for each treatment type?
SELECT treatment_type,
       SUM(treatment_cost) AS total_cost
FROM Treatments
GROUP BY treatment_type
ORDER BY total_cost DESC;

-- 8. Which treatment types have an average cost greater than 5000?
SELECT treatment_type,
       ROUND(AVG(treatment_cost), 2) AS average_cost
FROM Treatments
GROUP BY treatment_type
HAVING AVG(treatment_cost) > 5000
ORDER BY average_cost DESC;

-- 9. How many appointments has each doctor handled?
SELECT d.doctor_name,
       COUNT(a.appointment_id) AS total_appointments
FROM Doctors AS d
JOIN Appointments AS a
    ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name
ORDER BY total_appointments DESC;

-- 10. How many completed appointments has each doctor handled?
SELECT d.doctor_name,
       COUNT(a.appointment_id) AS completed_appointments
FROM Doctors AS d
JOIN Appointments AS a
    ON d.doctor_id = a.doctor_id
WHERE a.status = 'Completed'
GROUP BY d.doctor_name
ORDER BY completed_appointments DESC;

-- 11. Which medications are used most frequently?
SELECT m.medication_name,
       COUNT(t.treatment_id) AS times_used
FROM Medications AS m
JOIN Treatments AS t
    ON m.medication_id = t.medication_id
GROUP BY m.medication_name
ORDER BY times_used DESC;

-- 12. Which patients belong to Pune, Mumbai, or Nashik?
SELECT patient_id,first_name,last_name,city
FROM Patients
WHERE city IN ('Pune', 'Mumbai', 'Nashik')
ORDER BY city;

-- 13. Which treatments cost more than the average treatment cost?
SELECT treatment_id,
       treatment_type,
       treatment_cost
FROM Treatments
WHERE treatment_cost > (
    SELECT AVG(treatment_cost)
    FROM Treatments
)
ORDER BY treatment_cost DESC;

-- 14. How can treatments be categorized by cost?
SELECT treatment_id,
       treatment_type,
       treatment_cost,
       CASE
           WHEN treatment_cost < 5000 THEN 'Low Cost'
           WHEN treatment_cost BETWEEN 5000 AND 10000 THEN 'Medium Cost'
           ELSE 'High Cost'
       END AS cost_category
FROM Treatments
ORDER BY treatment_cost DESC;

-- 15. What is the ranking of treatments based on treatment cost?
SELECT treatment_id,
       treatment_type,
       treatment_cost,
       RANK() OVER (
           ORDER BY treatment_cost DESC
       ) AS cost_rank
FROM Treatments;
