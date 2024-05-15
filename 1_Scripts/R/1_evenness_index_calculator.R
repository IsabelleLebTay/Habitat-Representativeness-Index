gini_index <- function(p) {
  # Calculate the Gini index for a given distribution.
  
  n <- length(p)  # Number of elements in the array p
  
  sorted_p <- sort(p)  # Sort the array p in ascending order
  
  # Calculate the Gini index using the correct formula
  sum_i_p <- sum((1:n) * sorted_p)  # Weighted sum of sorted proportions
  gini <- (2 * sum_i_p) / (n * sum(sorted_p)) - (n + 1) / n
  
  return(gini)
}

calculate_evenness_indicator <- function(A, P) {
  # Calculate the biodiversity 30x30 target 3 indicator using the Gini index.
  
  # Calculate the proportion of protected area relative to total area for each ecoregion
  p_per_area <- P / A
  
  # Calculate the Gini index for the protected area proportions
  gini_protected <- gini_index(p_per_area)
  
  # Normalize the Gini index to get the indicator (1 - Gini index)
  indicator <- 1 - gini_protected
  
  return(indicator)  # Return the indicator value
}

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

