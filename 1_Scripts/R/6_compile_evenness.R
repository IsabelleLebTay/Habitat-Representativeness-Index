<<<<<<< HEAD
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
=======

evenness_years <- function(csv_file) {
  # Read the CSV file
  data <- read_csv(csv_file)
  
  # Ensure the necessary columns are present
  if (!all(c("zone", "total_area", "protected_area", "proportion", "year") %in% colnames(data))) {
    stop("The CSV file must contain the following columns: 'zone', 'total_area', 'protected_area', 'proportion', 'year'")
  }
  
  # Get unique years
  unique_years <- unique(data$year)
  
  # Initialize vectors to store results
  evenness_index <- numeric(length(unique_years))
  years <- numeric(length(unique_years))
  
  # Loop over each unique year to calculate the evenness index
  for (i in seq_along(unique_years)) {
    year <- unique_years[i]
    
    # Filter data for the current year
    year_data <- data %>% filter(year == !!year)
    
    # Extract the total areas and protected areas for the current year
    total_areas_real <- year_data$total_area
    protected_areas_real <- year_data$protected_area
    
    # Calculate the evenness index for the current year
    indicator_value_real <- evenness_indicator(total_areas_real, protected_areas_real)
    
    # Store the results
    evenness_index[i] <- indicator_value_real
    years[i] <- year
  }
  
  # Return the results as a list
  return(list(evenness_index = evenness_index, years = years))
}
>>>>>>> 74796878323ff62fb377473f87b7285b4b5af087
