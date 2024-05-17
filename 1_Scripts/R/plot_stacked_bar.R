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
    y0 = -45,
    y1 = -20
  )

  # Compute total protected area
  ## Read data
  filename <- sprintf("%s/%s_%s", 
                      import_config()$output_path,
                      unit,
                      import_config()$proportion_df)
  dat <- read.csv(filename)
  dat <- dat[dat$year %in% 2023,]

  total_protected_area <- main_coords["x1"]*(sum(dat$protected_area)/sum(dat$total_area))

  # New plot
  png(
    "figures/stacked_barplot.png",
    height = 500,
    width = 1000,
    unit = "px"
  )
  dev.new(height = 8, width = 16)
  plot(
    NA,
    xlim = c(secondary_coords["x0"], secondary_coords["x1"]),
    ylim = c(secondary_coords["y0"] - 20, main_coords["y1"]),
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
    xright = 100*(total_protected_area/30),
    ybottom = main_coords["y0"],
    ytop = main_coords["y1"],
    col = "#374f2f",
    border = "black"
  )  
  text(
    sprintf(
      "%.2f %%",
      round(total_protected_area, digits = 2)
    ),
    x = mean(c(main_coords["x0"],  100*(total_protected_area/30))),
    y = mean(main_coords[c("y0", "y1")]),
    col = "white",
    cex = 2.5
  )
  # Stacked bar by ecozones
  dat[,"x1_coords"] <- (cumsum(dat$protected_area)/max(cumsum(dat$protected_area)))*secondary_coords["x1"]
  dat[,"x0_coords"] <- c(secondary_coords["x0"], dat$x1_coords[1:(nrow(dat)-1)])
  custom_colors <- c("Northern Arctic" = "lightskyblue", "Arctic Cordillera" = "royalblue", "Southern Arctic" = "royalblue4", "Taiga Cordillera" = "lavenderblush3", "Taiga Plain" = "khaki4", "Taiga Shield" = "orangered4", "Boreal Cordillera" = "darkolivegreen", "Boreal PLain" = "darkgreen", "Pacific Maritime" = "turquoise3", "Boreal Shield" = "coral2", "Hudson Plain" = "lightsalmon3", "Montane Cordillera" = "gold3", "Prairie" = "orange", "Atlantic Maritime" = "midnightblue", "MixedWood Plain" = "springgreen")

  for(i in dat$zone) {
    rect(
      xleft = dat[dat$zone == i, "x0_coords"],
      xright = dat[dat$zone == i, "x1_coords"],
      ybottom = secondary_coords["y0"],
      ytop = secondary_coords["y1"],
      col = adjustcolor(custom_colors[i], alpha.f = 0.5),
      border = "black",
      lwd = 1
    )  
  }

  # Link the two bar
  segments(
    x0 = main_coords["x0"],
    x1 = secondary_coords["x0"],
    y0 = main_coords["y0"],
    y1 = secondary_coords["y1"],
    lwd = 2
  )
  segments(
    x0 = 100*(total_protected_area/30),
    x1 = secondary_coords["x1"],
    y0 = main_coords["y0"],
    y1 = secondary_coords["y1"],
    lwd = 2
  )

  legend(
    x = mean(secondary_coords[c("x0", "x1")]) + 9,
    y = secondary_coords["y0"]-15,
    legend = names(custom_colors),
    fill = adjustcolor(custom_colors, alpha.f = 0.5),
    ncol = 5,
    cex = 1.4,
    bty = "n",
    xjust = 0.5,
    yjust = 0.5
  )

  text(
    "Ecozones",
    x = secondary_coords["x0"]+9,
    y = secondary_coords["y0"]-15,
    adj = c(1, 0.5),
    cex = 1.5
  )

  dev.off()

}
