library(readr)
tourism <- read_csv("data/tourism-gdp-proportion-of-total-gdp.csv")

usethis::use_data(tourism, overwrite = TRUE)

# Filter data for a single country (e.g., "Australia") and a specific year range
library(dplyr)
australia_data <- tourism %>%
  filter(Entity == "Australia", Year >= 2008, Year <= 2022)

# Display filtered data
head(australia_data)
