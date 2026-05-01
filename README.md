# Dallas College Student Completion Audit
### Benchmarking Retention & Completion Rates Across Texas Community Colleges

![SAS](https://img.shields.io/badge/Analysis-SAS%2015.4-blue)
![Data](https://img.shields.io/badge/Data-IPEDS%202024-green)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)

---

## Overview

This project benchmarks student completion rates at Dallas College against 
34 Texas community college peers using publicly available IPEDS 2024 data. 
It was designed to mirror the core responsibilities of an Institutional 
Research analyst: data acquisition, longitudinal outcome analysis, peer 
benchmarking, and translating findings into actionable policy recommendations.

**Key Finding:** Dallas College's completion rate (68.1%) falls below the 
Texas peer average (70.3%), ranking 24th out of 35 institutions — despite 
being the largest community college in the dataset (69,749 students).

---

## Research Questions

1. How does Dallas College's student completion rate compare to Texas peer institutions?
2. Which institutional characteristics are associated with completion outcomes?
3. What do the data suggest for targeted student success interventions?

---

## Data Sources

All data sourced from the [IPEDS Data Center](https://nces.ed.gov/ipeds/use-the-data) (National Center for Education Statistics):

| File | Survey | Description |
|------|--------|-------------|
| HD2024 | Institutional Characteristics | Directory info, state, sector classification |
| EF2024A | Fall Enrollment | Race/ethnicity, gender, attendance status |
| DRVEF2024 | Derived Enrollment | Retention rates, enrollment totals |
| OM2024 | Outcome Measures | Completion, still enrolled, transfer-out rates |

> Raw CSV files are not included in this repository due to file size. 
> All files are freely available at nces.ed.gov/ipeds/use-the-data.

---

## Methodology

- **Software:** SAS 15.4
- **Sample:** 35 Texas public two-year institutions (SECTOR = 4), plus Dallas 
  College (SECTOR = 1 post-consolidation), N = 36
- **Outcome variable:** Completion rate = completers / (completers + still enrolled + transfers) × 100
- **Cohort:** OMCHRT = 10 (total cohort, 150% time)
- **Peer exclusion:** Southwest College for the Deaf excluded (n = 47, specialized mission)

**Analytical steps:**
1. PROC IMPORT — CSV ingestion and library setup
2. PROC SQL — Institution filtering and multi-table merging
3. PROC MEANS / PROC CORR — Descriptive statistics and correlation analysis
4. PROC SGPLOT — Peer benchmarking visualization

---

## Key Results

| Metric | Dallas College | TX Peer Average | Rank |
|--------|---------------|-----------------|------|
| Completion Rate | 68.1% | 70.3% | 24 of 35 |
| Transfer-Out Rate | 18% | 25.7% | — |
| Part-Time Retention | 7% | 2.7% | — |
| Total Enrollment | 69,749 | 9,008 | Largest |

**Correlation analysis** found no significant relationship between institutional 
size and completion rate (r = 0.04, p = 0.82), suggesting the completion gap 
reflects student-level factors rather than scale complexity.

---

## Deliverables

- 📊 `output/completion_rate_chart.png` — Peer benchmarking bar chart
- 📄 `output/Dallas_IR_Policy_Memo.docx` — Two-page policy memo for leadership
- 💻 `code/` — Annotated SAS programs (import → merge → analyze → visualize)

---

## Policy Recommendations

Based on the data, three interventions are supported by the evidence:

1. **Early alert systems** targeting students with low engagement in weeks 1–8
2. **Part-time advising pathways** with flexible scheduling and financial aid navigation
3. **Post-consolidation cohort tracking** by legacy campus to identify service area gaps

---

## Author

**Sophie (Nhi) Tran** | Graduate Student, Biostatistics — University of South Florida  
[GitHub](https://github.com/nhitrandn) | nhisa@usf.edu
