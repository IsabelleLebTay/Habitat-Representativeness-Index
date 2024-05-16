source("1_Scripts/R/5_plot_trend.R")

library(ggplot2)

# Example usage
evenness_index <- c(0.1, 0.15, 0.223, 0.45, 0.455)
years <- c(2016, 2017, 2018, 2019, 2020)
plot_temporal_trend(evenness_index, years)

