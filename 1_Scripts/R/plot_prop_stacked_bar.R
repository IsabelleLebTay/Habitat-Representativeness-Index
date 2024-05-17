#' Plot proportional stacked bar
#' 
#' @export

plot_prop_stacked_bar(unit = "ecozones") {

  # Coordinates of the main stacked bar
  main_coords <- c(
    x0 = 0,
    x1 = 100,
    y0 = 0,
    y1 = 15
  )

  # Coordinates of the secondary stacked bar
  secondary_coords <- c(
    x0 = -20,
    x1 = 120,
    y0 = -100,
    y1 = -70
  )

  # Compute total protected area
  ## Read data
  filename <- sprintf("%s/%s_%s", 
                      import_config()$output_path,
                      unit,
                      import_config()$proportion_df)
  dat <- read.csv(filename)

  total_protected_area <- main_coords["x1"]*(sum(dat$protected_area)/sum(dat$total_area))

  # New plot
  png(
    "figures/stacked_barplot.png",
    height = 500,
    width = 1000,
    unit = "px"
  )
  plot(
    NA,
    xlim = c(secondary_coords["x0"], secondary_coords["x1"]),
    ylim = c(secondary_coords["y0"], main_coords["y1"]),
    axes = FALSE,
    bty = "n",
    xlab = "",
    ylab = ""
  )
  # Main rectangle
  rect(
    xleft = main_coords["x0"],
    xright = main_coords["x1"],
    ybottom = main_coords["y0"],
    ytop = main_coords["y1"],
    col = "grey",
    border = "black"
  )
  # Total protected rectangle
  rect(
    xleft = main_coords["x0"],
    xright = total_protected_area,
    ybottom = main_coords["y0"],
    ytop = main_coords["y1"],
    col = "#374f2f",
    border = "black"
  )  

  # Stacked bar by ecozones
  dat[,"x1_coords"] <- (cumsum(dat$proportion)/max(cumsum(dat$proportion)))*secondary_coords["x1"]
  dat[,"x0_coords"] <- c(secondary_coords["x0"], dat$x1_coords[1:(nrow(dat)-1)])
  custom_colors <- c("Northern Arctic" = "lightskyblue", "Arctic Cordillera" = "royalblue", "Southern Arctic" = "royalblue4", "Taiga Cordillera" = "lavenderblush3", "Taiga Plain" = "khaki4", "Taiga Shield" = "orangered4", "Boreal Cordillera" = "darkolivegreen", "Boreal PLain" = "darkgreen", "Pacific Maritime" = "turquoise3", "Boreal Shield" = "coral2", "Hudson Plain" = "lightsalmon3", "Montane Cordillera" = "gold3", "Prairie" = "orange", "Atlantic Maritime" = "midnightblue", "MixedWood Plain" = "springgreen")

  for(i in dat$zone) {
    rect(
      xleft = dat[dat$zone == i, "x0_coords"],
      xright = dat[dat$zone == i, "x1_coords"],
      ybottom = secondary_coords["y0"],
      ytop = secondary_coords["y1"],
      col = custom_colors[i],
      border = custom_colors[i],
      lwd = 0
    )  
  }
  dev.off()


}
