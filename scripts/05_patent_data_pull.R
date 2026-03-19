# ==========================================
# Script: 05_patent_data_pull.R
# Purpose: Fetching Patent Data and Merging it
# ==========================================

library(WDI)
library(tidyverse)

# 1. Increase timeout 
options(timeout = max(300, getOption("timeout")))

# 2. Pull the Patent Data
# "IP.PAT.RESD" is the code for: Patent applications, residents
print("Fetching Patent data from World Bank API...")

patent_raw <- WDI(
  indicator = "IP.PAT.RESD", 
  country = "all", 
  start = 2000, 
  end = 2023
)

# 3. Clean the data
patent_data <- patent_raw %>%
  rename(patents_resident = IP.PAT.RESD) %>%
  filter(!is.na(patents_resident))

# 4. Load our Master Dataset
master_data <- read_csv("data/master_combined_data.csv") 

# 5. Join the Patents to the Master Data
master_data_v2 <- master_data %>%
  left_join(patent_data, by = c("iso2c", "country", "year"))

# 6. Save the updated Master dataset
write_csv(master_data_v2, "data/master_combined_data_v2.csv")

print("Patent data merged successfully! Master V2 saved.")