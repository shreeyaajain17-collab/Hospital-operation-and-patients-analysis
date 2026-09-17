# 🏥 Hospital Operations & Patient Analytics

> A SQL-based healthcare analytics project designed to analyze hospital operations, patient demographics, appointments, treatments, medication usage, and billing performance.

---

## 📌 Project Overview

Healthcare organizations generate large amounts of operational data across patients, doctors, departments, appointments, treatments, medications, and billing.

This project uses a relational healthcare database to answer practical business questions and generate insights that can support:

- Patient management
- Doctor workload analysis
- Appointment monitoring
- Treatment cost analysis
- Medication usage analysis
- Revenue and billing monitoring
- Operational decision-making

The project focuses on using SQL to transform raw relational data into meaningful business insights.

---

## 🎯 Business Objectives

The main objectives of this project are to:

1. Analyze patient demographics and geographic distribution.
2. Understand doctor workload and appointment activity.
3. Analyze appointment status and patient visit patterns.
4. Identify treatment types with higher costs.
5. Analyze medication utilization.
6. Identify treatments above the average treatment cost.
7. Analyze billing and outstanding payments.
8. Generate actionable insights for hospital operations.

---

## 🗂️ Database Structure

The database contains the following relational tables:

| Table | Description |
|---|---|
| `Departments` | Hospital department information |
| `Doctors` | Doctor details and department assignments |
| `Patients` | Patient demographic information |
| `Medications` | Medication information |
| `Appointments` | Patient appointments with doctors |
| `Treatments` | Treatments provided to patients |
| `Billing` | Hospital billing and payment information |

### Dataset Size

| Table | Records |
|---|---:|
| Departments | 8 |
| Doctors | 30 |
| Patients | 350 |
| Medications | 100 |
| Appointments | 500 |
| Treatments | 250 |
| Billing | 250 |
| **Total** | **1,488** |

---

## 🔗 Database Relationships

The database follows a relational structure where entities are connected using primary and foreign keys.

```text
Departments
     │
     └── Doctors
            │
            └── Appointments
                    │
                    └── Patients
                           │
                           └── Treatments
                                  │
                                  └── Medications

Patients
   │
   └── Billing
