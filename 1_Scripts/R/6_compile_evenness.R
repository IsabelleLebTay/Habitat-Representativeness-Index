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


