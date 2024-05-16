source("1_Scripts/R/3_evenness_index_calculator.R")

# This runs the index calculator for each year and store the outputs as a 2d array

# Each year is a csv file with 4 columns: "zone","total_area","protected_area","proportion"
# returns: two arrays like 
# evenness_index <- c(0.1, 0.15, 0.223, 0.45, 0.455)
# years <- c(2016, 2017, 2018, 2019, 2020)

library(readr)

evenness_years <- function() {


}

current_data <- read_csv("output/ecozones_proportion_protected.csv")
total_areas_real <- current_data$total_area
protected_areas_real <- current_data$protected_area
indicator_value_real <- evenness_indicator(total_areas_real, protected_areas_real)
print(paste("Biodiversity 30x30 Target 3 Indicator:", indicator_value_real))
