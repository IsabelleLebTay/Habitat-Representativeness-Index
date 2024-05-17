source("Habitat-Representativeness-Index/1_Scripts/R/5_evenness_index_calculator.R")
source("Habitat-Representativeness-Index/1_Scripts/R/6_compile_evenness.R")
# Load necessary libraries
library(readr)
library(dplyr)
# getwd()
# This runs the index calculator for each year and store the outputs as a 2d array

# Takes a csv with 5 columns: "zone","total_area","protected_area","proportion", "year"
# For each year, calculate the evenness_indicator, and store as two arrays
# returns: two arrays like 
    # evenness_index <- c(0.1, 0.15, 0.223, 0.45, 0.455)
    # years <- c(2016, 2017, 2018, 2019, 2020)


# Example usage
csv_file <- "Habitat-Representativeness-Index/output/ecozones_proportion_protected.csv"

# Call the function to calculate evenness indices for each year
results <- evenness_years(csv_file)
str(results)
results_df <- data.frame(
  years = results$years,
  evenness_index = results$evenness_index
)
write.csv(results_df, "Habitat-Representativeness-Index/output/PHEI_per_year.csv", row.names = FALSE)

results.to_csv("Habitat-Representativeness-Index/output/PHEI_per_year.csv")
# Print the results
print(paste("Evenness Indices:", paste(results$evenness_index, collapse = ", ")))
print(paste("Years:", paste(results$years, collapse = ", ")))

# Example of running the evenness indicator for a specific year
current_data <- read_csv(csv_file) %>% filter(year == 2022)
total_areas_real <- current_data$total_area
protected_areas_real <- current_data$protected_area
indicator_value_real <- evenness_indicator(total_areas_real, protected_areas_real)
print(paste("Biodiversity 30x30 Target 3 Indicator for 2023:", indicator_value_real))
