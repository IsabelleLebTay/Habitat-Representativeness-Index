#' Plot evenness trend over time
#'
#' @param evenness_index (array): Array of calculated index per year of size n years
#' @param years (array): Array of the year in which each index is associated with, of size n years
#'
#' @return plot: A ggplot object showing the temporal trend of the evenness index
#' @examples
#' evenness_index <- c(0.8, 0.7, 0.85, 0.9, 0.87)
#' years <- c(2016, 2017, 2018, 2019, 2020)
#' plot_temporal_trend(evenness_index, years)
#' 

plot_temporal_trend <- function(evenness_index, years) {
  # Check that the lengths of the inputs are equal
  if (length(evenness_index) != length(years)) {
    stop("The length of evenness_index and years must be the same.")
  }

  # Create a data frame from the input arrays
  data <- data.frame(
    Year = years,
    EvennessIndex = evenness_index
  )

  # Create the plot using ggplot2
  p <- ggplot(data, aes(x = Year, y = EvennessIndex)) +
    geom_line(aes(color = "Current evenness"), size = 1) +
    geom_point(aes(color = "Current evenness")) +
    geom_hline(aes(yintercept = 1, color = "Target evenness"), linetype = "dashed", size = 1) +  # Add baseline at 1
    labs(title = "Temporal Trend of Evenness Index",
         x = "Year",
         y = "Evenness Index",
         color = "Legend") +
    scale_color_manual(values = c("Current evenness" = "#ff00ae", "Target evenness" = "#278e27")) +
    theme_minimal() +
    ylim(0,1)+
    theme(
      panel.grid.major = element_blank(),  # Remove major gridlines
      panel.grid.minor = element_blank(),  # Remove minor gridlines
      axis.line = element_line(size = 0.5, color = "black"),  # Keep axes lines
      axis.text = element_text(size = 14),  # Make axis numbers larger
      axis.title = element_text(size = 16),  # Make axis titles larger
      legend.text = element_text(size = 14),  # Make legend text larger
      legend.title = element_text(size = 16),  # Make legend title larger
      plot.title = element_text(size = 18)  # Make plot title larger
    ) # Keep axes lines
  # Print the plot
  print(p)
}
