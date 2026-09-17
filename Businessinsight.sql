
-- 1 BUSINESS INSIGHT: Which cities have the highest number of patients?
SELECT city,
       COUNT(*) AS patient_count
FROM Patients
GROUP BY city
ORDER BY patient_count DESC;

-- Business insight: Focus outreach and healthcare services on high-patient cities.

-- 2. BUSINESS INSIGHT: Which doctors have the highest appointment workload?
SELECT d.doctor_name,
       COUNT(a.appointment_id) AS total_appointments
FROM Doctors AS d
JOIN Appointments AS a
    ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name
ORDER BY total_appointments DESC;

-- Business insight: Use workload data for staff balancing and resource planning.

-- 3. BUSINESS INSIGHT: What is the appointment performance by status?
SELECT status,
       COUNT(*) AS total_appointments
FROM Appointments
GROUP BY status
ORDER BY total_appointments DESC;

-- Business insight: High cancellations or no-shows may require better reminders and scheduling.

-- 4. BUSINESS INSIGHT: Which treatment types contribute the highest total cost?
SELECT treatment_type,
       SUM(treatment_cost) AS total_treatment_cost
FROM Treatments
GROUP BY treatment_type
ORDER BY total_treatment_cost DESC;

-- Business insight: Use high-cost treatment areas for budgeting and resource allocation.

-- 5. BUSINESS INSIGHT: What is the hospital's billing and payment position?
SELECT
    SUM(total_amount) AS total_billed,
    SUM(insurance_covered) AS total_insurance_covered,
    SUM(patient_paid) AS total_patient_paid
FROM Billing;

-- Business insight: Compare total billing, insurance contribution, and direct patient payments.

-- 6. BUSINESS INSIGHT: What is the payment status of hospital bills?
SELECT payment_status,
       COUNT(*) AS bill_count
FROM Billing
GROUP BY payment_status
ORDER BY bill_count DESC;

-- Business insight: Pending or partially paid bills can indicate collection issues.

-- 7. BUSINESS INSIGHT: Which medications are used most frequently?
SELECT m.medication_name,
       COUNT(t.treatment_id) AS usage_count
FROM Medications AS m
JOIN Treatments AS t
    ON m.medication_id = t.medication_id
GROUP BY m.medication_name
ORDER BY usage_count DESC;

-- Business insight: Frequently used medications can guide inventory planning.
