source("1_Scripts/R/1_read_data.R")
source("R/zzz.R")
source("1_Scripts/R/0_dl_data.R")

# Filter the protection areas by their level
# This function filters the the protected areas by their IUCN_CAT value, which have 9 possible values.
# Returns the same type of thing as read_protected_areas
library(dplyr)
library(sf)
library(here)

# Define the protection levels and their names
protection_levels_names <- c(
  "Strict Nature Reserve",
  "Wilderness Area",
  "National Park",
  "Natural Monument or Feature",
  "Habitat/Species Management Area",
  "Protected Landscape/Seascape",
  "Protected Area with Sustainable Use of Natural Resources",
  "Not reported",
  "Not applicable"
)

protection_levels_numbers <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)

# Define the filter_protection_level function
filter_protection_level <- function(protection_levels) {
  # Read the protected areas data
  protected_areas <- read_protected_areas()
  
  # Filter the data by the specified protection levels
  filtered_areas <- protected_areas %>%
    filter(IUCN_CAT %in% protection_levels)
  
  # Define the output file path
  output_file <- here::here("output/protected_areas_1_to_6.geojson")
  
  # Save the filtered data to a file
  sf::st_write(filtered_areas, output_file, delete_dsn = TRUE)
  
  # Return the filtered data
  return(filtered_areas)
}

# Example usage
# Filter the protected areas by IUCN_CAT values 1 to 6
dl_protected_areas()
filtered_data <- filter_protection_level(c(1, 2, 3, 4, 5, 6))

# Print the filtered data
print(filtered_data)
