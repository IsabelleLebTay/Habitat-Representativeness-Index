gini_index <- function(p) {
  # """
  # Calculate the Gini index for a given distribution.
  
  # Parameters:
  # p (array): Array representing the distribution proportions.
  
  # Returns:
  # float: Gini index.
  # """
  # Calculate the Gini index for a given distribution.
  
  n <- length(p)  # Number of elements in the array p
  
  sorted_p <- sort(p)  # Sort the array p in ascending order
  
  # Calculate the Gini index using the correct formula
  sum_i_p <- sum((1:n) * sorted_p)  # Weighted sum of sorted proportions
  gini <- (2 * sum_i_p) / (n * sum(sorted_p)) - (n + 1) / n
  
  return(gini)
}

evenness_indicator <- function(A, P) {
  # """
  # Calculate the biodiversity 30x30 target 3 indicator using the Gini index.
  
  # Parameters:
  # A (array): Total area of each ecoregion.
  # P (array): Protected area within each ecoregion.
  
  # Returns:
  # float: Indicator value bounded between 0 and 1.
  # """  
  # Calculate the proportion of protected area relative to total area for each ecoregion
  p_per_area <- P / A
  
  # Calculate the Gini index for the protected area proportions
  gini_protected <- gini_index(p_per_area)
  
  # Normalize the Gini index to get the indicator (1 - Gini index)
  indicator <- 1 - gini_protected
  
  return(indicator)  # Return the indicator value
}
