# Global Space Missions Historical Analysis (1950s - 2020s)

## Project Overview
This project performs a comprehensive historical analysis of global space missions from the dawn of the space age in the 1950s up to the 2020s. Using a dataset of space launches, the analysis tracks key metrics including mission success trends, rocket cost-to-activity correlations, ideal launch time windows, and the geographic distribution and accumulation of unique launch sites over time.

The project demonstrates advanced data engineering and analytics capabilities using MySQL, transforming raw operational logs into structured historical insights.

---

## Tech Stack & Key SQL Techniques Used
* **Database Engine:** MySQL
* **Data Cleaning & Transformation:** String manipulation (`SUBSTRING_INDEX`, `REPLACE`), conditional mapping (`CASE WHEN`), and type handling (`COALESCE`, `NULLIF`).
* **Advanced Analytics:** * **Window Functions:** `LEAD()`, `DENSE_RANK()`, `ROW_NUMBER()`, and cumulative running totals (`SUM() OVER()`).
  * **Common Table Expressions (CTEs):** Isolating complex multi-stage aggregations for cleaner processing.
  * **Subqueries & Derived Tables:** Tracking entity lifecycle milestones (e.g., establishing launch site "birth decades").

---

## Data Cleaning & Feature Engineering
Before running the core analysis, the raw dataset underwent rigorous data cleaning (detailed in `data_cleaning.sql`):
* **Location Extraction:** Standardized geography records by stripping full addresses to isolate localized regions and countries using `SUBSTRING_INDEX`.
* **Chronological Binning:** Engineered a `decade` feature based on launch timestamps to enable macro-level trend lines.
* **Diurnal Categorization:** Grouped raw timestamps into distinct diurnal windows (`Midnight`, `Early Morning`, `Morning`, `Noon`, `Afternoon`, `Evening`, `Night`) to evaluate operational performance by time of day.
* **Anomaly Rectification:** Manually patched syntax anomalies in mission logs (e.g., fixing `nt-` characters to `No.`) and handled missing values across rocket structural profiles.

---

## Key Insights & Analytical Findings

### 1. Optimal Launch Windows (`Question 1`)
* **Finding:** The **Morning** window is historically the most successful time frame for space launches, securing **1,140 successful missions**. 
* **Lead Margin:** Morning launches outperform the second-best window (Night) by **321 missions**, holding a dominant **39.19% performance lead**.

### 2. Rocket Activity vs. Operational Cost (`Questions 2 & 3`)
* **Finding:** While historical data includes heavy-lifters with unrecorded costs (such as the legacy *Cosmos-3M*, which clocked 446 launches before retiring in 2010), modern active fleets show a strict correlation between structural utilization and clear commercial pricing.
* **Top Active Asset:** *Falcon 9 Block 5* leads modern active operations with **111 launches** as of July 2022, carrying an aggregated program ledger of **$7.44B**.

### 3. Macro Success Trends Over Time (`Question 6`)
* **Finding:** The reliability of global aerospace engineering saw a massive evolutionary leap between the early space race and modern infrastructure.
* **Trend:** Global mission success rates hovered at a volatile **31.37% in the 1950s** and **79.07% in the 1960s**. However, from the 1970s onward, global mission success stabilized permanently, **never dropping below 91%** in any subsequent decade.

### 4. Geopolitical Dominance & Consistency (`Question 7`)
* **Finding:** Using partitioned row numbering to rank countries by successful launches per decade reveals clear historical continuity.
* **Result:** The **USA** has consistently maintained a **Top 3 global ranking** for successful space missions in every single decade from the 1950s through to the 2020s.

### 5. Launch Site Geographic Accumulation (`Question 8`)
* **Finding:** By evaluating the "birth decade" of every unique launch facility, the analysis tracks how nations scaled their infrastructural footprint.
* **Example:** **China** has established **18 unique launch sites** over time. Its infrastructure scaled incrementally across the 70s, 80s, and 90s, before experiencing an aggressive expansion in the **2010s**, where it added **6 new unique sites** in a single decade.

---

## Repository Structure
* `data_cleaning.sql`: Contains all DDL and DML scripts used for schema modification, text formatting, and data preparation.
* `space_missions_analysis.sql`: Contains the optimized analytical queries, CTEs, and window functions used to answer the core business questions.

## 📊 Power BI Dashboards
Here are the interactive dashboards built to visualize the key performance metrics and historical trends of global space missions:

### 1. Mission Total Expenses Overview
![Mission Performance Overview](dashboard_page1.png)

### 2. Rocket Launches Trends
![Regional Analysis](dashboard_page2.png)

### 3. Companies Responsible for Space Missions
![Fleet Insights](dashboard_page3.png)
