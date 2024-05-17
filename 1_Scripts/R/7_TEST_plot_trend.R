source("Habitat-Representativeness-Index/1_Scripts/R/7_plot_trend.R")

library(ggplot2)

# Example usage
# evenness_index <- c(0.1, 0.15, 0.223, 0.45, 0.455)
# years <- c(2016, 2017, 2018, 2019, 2020)
PHEIC_years <- read_csv("Habitat-Representativeness-Index/output/PHEI_per_year.csv")
plot_temporal_trend(PHEIC_years$evenness_index, PHEIC_years$years)
ggsave(filename = "Habitat-Representativeness-Index/figures/trend_last3years.png", plot = last_plot())
