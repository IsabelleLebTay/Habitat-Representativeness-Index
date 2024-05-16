# Filter the protection areas by their level
# This function filters the the protected areas by their IUCN_CAT value, which have 9 possible values.
# They are:




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