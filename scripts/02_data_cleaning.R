# ==========================================
# Step 2: Categorizing Countries into Regions
# ==========================================

# 1. Let's define our country buckets using ISO-2 country codes
oecd_west <- c("US", "GB", "DE", "FR", "IT", "CA", "AU", "SE", "CH", "NL", "ES", "JP", "KR") # Core Western/OECD Baseline
gulf_rentier <- c("SA", "AE", "QA", "KW", "OM", "BH") # Saudi Arabia, UAE, Qatar, Kuwait, Oman, Bahrain
mena_emerging <- c("EG", "MA", "JO", "TN", "DZ", "TR", "IR", "PK", "ID", "MY") # Egypt, Morocco, Jordan, Turkey, Pakistan, Malaysia, etc.
mena_fragile <- c("SY", "IQ", "YE", "LY", "LB", "SD") # Syria, Iraq, Yemen, Libya, Lebanon, Sudan

# 2. Apply these categories to our dataset
rd_categorized <- rd_data %>%
  mutate(
    region_category = case_when(
      iso2c %in% oecd_west ~ "1. The West (OECD)",
      iso2c %in% gulf_rentier ~ "2. Rentier States (Gulf)",
      iso2c %in% mena_emerging ~ "3. Emerging Economies",
      iso2c %in% mena_fragile ~ "4. Fragile States",
      TRUE ~ "Other" # Label everything else as 'Other'
    )
  ) %>%
  # 3. Filter out the "Other" countries to keep our analysis strictly focused on our Research Question
  filter(region_category != "Other")

# 4. Let's check our work! This will print a count of how many data points we have for each region
table(rd_categorized$region_category)

# 5. Save this clean, categorized dataset for our charts
write_csv(rd_categorized, "data/cleaned_rd_categorized.csv")