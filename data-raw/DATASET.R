## code to prepare `DATASET` dataset goes here

tourism <- read_csv("data/tourism-gdp-proportion-of-total-gdp.csv")

usethis::use_data(tourism, overwrite = TRUE)

write.csv(tourism, file = "tourism.csv")

# Filter data for a single country (e.g., "Australia") and a specific year range
australia_data <- tourism %>%
  filter(Entity == "Australia", Year >= 2008, Year <= 2022)

usethis::use_data(australia_data, overwrite = TRUE)
write.csv(australia_data, file = "australia_data.csv")


