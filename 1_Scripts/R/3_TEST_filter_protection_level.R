source("1_Scripts/R/2_filter_protection_level.R")

# Test for filter_protection_level()
# Load necessary library

# Function to generate random strings for "region" column
random_strings <- function(n, length = 5) {
  sapply(1:n, function(x) paste(sample(letters, length, replace = TRUE), collapse = ""))
}

# Set the number of rows
num_rows <- 10

# Create the dataframe
df <- data.frame(
  region = random_strings(num_rows),
  total_area = sample(1:1000, num_rows, replace = TRUE),
  level1 = sample(1:100, num_rows, replace = TRUE),
  level2 = sample(1:100, num_rows, replace = TRUE)
)


# Test the filter_protection_level function
protection_levels_to_sum <- c(1, 2)  # Example protection levels
result <- filter_protection_level(df, protection_levels_to_sum)

# Print the results
print(result$total_area)
print(result$sum_of_areas)
