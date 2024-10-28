library(readr)
tourism <- read_csv("data/tourism-gdp-proportion-of-total-gdp.csv")

usethis::use_data(tourism, overwrite = TRUE)

