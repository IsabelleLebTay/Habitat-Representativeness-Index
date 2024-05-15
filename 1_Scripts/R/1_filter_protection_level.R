# Filter---
filter_protection_level <- function(dataframe, protection_level) {
  
  # Summarises the protected area by supplied amount

  # Parameters:
  # dataframe (data.frame): Dataframe of n regions and each total size, and 
  #                         size of protected sites of each type
  # protection_level (list): list of integers from 1-9 designing the protected level designations to sum

  # Returns:
  # list: A list containing two elements - an array of Total area and an array of sum of protected areas.
  protection_columns <- paste0("level", protection_level)

  dataframe$sum_of_areas <- rowSums(dataframe[, protection_columns, drop = FALSE])

  # Extract the required columns as arrays
  total_area_array <- dataframe$Total_area
  sum_of_areas_array <- dataframe$sum_of_areas
  
  # Return the two arrays in a list
  return(list(total_area = total_area_array, sum_of_areas = sum_of_areas_array))
}


# Test---
# Load necessary library
library(dplyr)

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
