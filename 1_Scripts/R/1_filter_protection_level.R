# Filter---
filter_protection_level <- function(dataframe, ) {
    """
    Summarises the protected area by supplied amount

    Parameters:
    dataframe (data.frame): Dataframe of n regions and each total size, and 
                            size of protected sites of each type
    protection_level (list): list designing the protected level designations to sum

    Returns:
    array: Protected area within each ecoregion.
    """



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
  `Total area` = sample(1:1000, num_rows, replace = TRUE),
  level1 = sample(1:100, num_rows, replace = TRUE),
  level2 = sample(1:100, num_rows, replace = TRUE)
)

# Print the dataframe
str(df)
