source("1_Scripts/R/3_evenness_index_calculator.R")

# Test for evenness_indicator()
# Simulate data for testing
set.seed(42)  # For reproducibility
num_ecoregions <- 4
total_areas <- runif(num_ecoregions, 100, 1000)  # Total area of each ecoregion
protected_areas <- mapply(function(x) runif(1, min = 0, max = x), total_areas)  # Protected area within each ecoregion

# protected_areas <- total_areas * 0.25  # Protected area within each ecoregion

# Calculate the indicator
indicator_value <- evenness_indicator(total_areas, protected_areas)

# Print the results
print(paste("Total Areas of Ecoregions:", paste(total_areas, collapse = ", ")))
print(paste("Protected Areas within Ecoregions:", paste(protected_areas, collapse = ", ")))
print(paste("Biodiversity 30x30 Target 3 Indicator:", indicator_value))



# Test with 2023 data, which is a csv file with 4 columns: "zone","total_area","protected_area","proportion"
library(readr)
current_data <- read_csv("output/ecozones_proportion_protected.csv")
total_areas_real <- current_data$total_area
protected_areas_real <- current_data$protected_area
indicator_value_real <- evenness_indicator(total_areas_real, protected_areas_real)
print("Results with 2023 data:")
print(paste("Biodiversity 30x30 Target 3 Indicator:", indicator_value_real))
