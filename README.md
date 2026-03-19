# The Global Innovation Gap: A Macro-Comparative Analysis

## 📌 Project Overview
This project investigates the systemic, historical, and structural factors driving the shift in STEM innovation from the Muslim-majority world to the West. Rather than treating the non-Western world as a monolith, this analysis segments global macroeconomic data into four distinct geopolitical archetypes: The West (OECD), Rentier States (Gulf), Emerging Economies, and Fragile States.

## 📊 Data & Methodology
Data was sourced programmatically from the **World Bank API (2000–2023)** using R. The analysis focuses on:
* **R&D Expenditure (% of GDP):** Measuring state-level innovation prioritization.
* **Oil Rents (% of GDP):** Testing the "Resource Curse" hypothesis.
* **Resident Patent Applications:** Evaluating domestic commercialization and institutional health.

<img width="1920" height="1152" alt="image" src="https://github.com/user-attachments/assets/b85fd202-20da-43e0-aebf-49ac04f6b6ff" />


## 🚀 Key Findings
1. **The Funding Gap:** Western economies consistently invest >2% of GDP into R&D, while fragile states remain paralyzed by instability.
2. **The Resource Curse:** Ordinary Least Squares (OLS) regression confirms a statistically significant inverse relationship (p < 0.001) between oil wealth and R&D spending. Guaranteed extraction revenue structurally disincentivizes knowledge-based economic development.
3. **Institutional Bottlenecks:** A logarithmic analysis of resident patent applications reveals a near-zero commercialization rate in the Middle Eastern archetypes, indicating severe "Brain Drain" and a lack of protective institutional ecosystems.

## 🛠️ Technologies Used
* **Language:** R
* **Libraries:** `tidyverse`, `WDI` (World Bank API), `ggplot2`, `broom`
* **Output:** R Markdown (HTML)
