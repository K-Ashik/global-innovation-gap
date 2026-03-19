# 1. Increase R's download timeout to 5 minutes (300 seconds)
options(timeout = max(300, getOption("timeout")))

# 2. Try the pull again
print("Fetching data... please wait, this might take a couple of minutes.")

rd_raw <- WDI(
  indicator = "GB.XPD.RSDV.GD.ZS", 
  country = "all", 
  start = 2000, 
  end = 2023
)

# 3. Clean and save (if successful!)
rd_data <- rd_raw %>%
  rename(rd_expenditure_pct = GB.XPD.RSDV.GD.ZS) %>%
  filter(!is.na(rd_expenditure_pct)) 

write_csv(rd_data, "data/wb_rd_expenditure_2000_2023.csv")
head(rd_data)