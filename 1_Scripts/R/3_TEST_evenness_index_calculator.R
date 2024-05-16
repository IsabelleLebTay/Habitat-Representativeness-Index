source("1_Scripts/R/3_evenness_index_calculator.R")

# Test for evenness_indicator()
# Simulate data for testing
set.seed(42)  # For reproducibility
num_ecoregions <- 4
total_areas <- runif(num_ecoregions, 100, 1000)  # Total area of each ecoregion
protected_areas <- mapply(function(x) runif(1, min = 0, max = x), total_areas)  # Protected area within each ecoregion

# protected_areas <- total_areas * 0.25  # Protected area within each ecoregion

# Calculate the indicator
indicator_value <- calculate_gini_indicator(total_areas, protected_areas)

# Print the results
print(paste("Total Areas of Ecoregions:", paste(total_areas, collapse = ", ")))
print(paste("Protected Areas within Ecoregions:", paste(protected_areas, collapse = ", ")))
print(paste("Biodiversity 30x30 Target 3 Indicator:", indicator_value))
