# ==========================================
# Script: 04_oil_data_pull.R
# Purpose: Fetching Oil Data (MANUAL BYPASS) and Merging
# ==========================================

library(tidyverse)

print("Reading manual CSV bypass...")

# 1. Read the manual CSV. (The 'skip = 4' ignores the World Bank header text)
oil_raw <- read_csv("data/oil_rents_raw.csv", skip = 4)

# 2. Reshape the data from "Wide" (years as columns) to "Long" (years as rows)
oil_data <- oil_raw %>%
  # Select the Country Name and the years we want
  select(country = `Country Name`, `2000`:`2023`) %>%
  # Pivot the years into a single column
  pivot_longer(
    cols = `2000`:`2023`, 
    names_to = "year", 
    values_to = "oil_rents_pct"
  ) %>%
  # Make sure the 'year' column is treated as a number
  mutate(year = as.numeric(year)) %>%
  # Remove missing data
  filter(!is.na(oil_rents_pct))

print("Oil data cleaned! Now merging with R&D data...")

# 3. Load our previously saved R&D dataset (FIXED PATH)
rd_categorized <- read_csv("data/cleaned_rd_categorized.csv") 

# 4. Join the two datasets together based on Country Name and Year!
combined_data <- rd_categorized %>%
  left_join(oil_data, by = c("country", "year")) %>%
  # Filter out any rows that don't have BOTH R&D and Oil data
  filter(!is.na(oil_rents_pct) & !is.na(rd_expenditure_pct))

# 5. Save the new "Master" dataset (FIXED PATH)
write_csv(combined_data, "data/master_combined_data.csv")

print("Data joined successfully! Master dataset saved.")
