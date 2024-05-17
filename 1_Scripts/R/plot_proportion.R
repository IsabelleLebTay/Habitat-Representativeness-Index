#' Plot proportional stacked bar
#' 
#' @export

plot_proportion() {

  # Compute total protected area
  ## Read data
  filename <- sprintf("%s/%s_%s", 
                      import_config()$output_path,
                      unit,
                      import_config()$proportion_df)
  dat <- read.csv(filename)
  dat <- dat[dat$year %in% 2023,]
  dat$proportion <- round(dat$proportion*100, digits = 2)
  dat <- dat[order(dat$proportion, decreasing = TRUE),]

  coords <- c(
    x0 = 0,
    x1 = 30,
    y0 = 0,
    y1 = nrow(dat) + 1
  )

  # New plot
  png(
    "figures/proportion_barplot.png",
    height = 8,
    width = 16,
    unit = "in",
    res = 500
  )
  plot(
    NA,
    xlim = c(coords["x0"] - 3, coords["x1"]),
    ylim = c(coords["y0"] - 1, coords["y1"]),
    axes = FALSE,
    bty = "n",
    xlab = "",
    ylab = ""
  )
  axis(
    side = 1,
    at = c(0, 10, 20, 30),
    pos = -0.5,
    cex.axis = 1.4
  )
  text(
    labels = "Proportion of protected areas (%)",
    x = mean(coords[1:2]),
    y = -2.4,
    xpd = TRUE,
    cex = 1.6
  )
  for(i in 1:nrow(dat)) {
    tmp <- dat[i,]
    rect(
      ybottom = 0+(i-1) + (i/nrow(dat)),
      ytop = i + (i/nrow(dat)),
      xleft = 0,
      xright = 30,
      col = adjustcolor("lightgrey", alpha.f = 0.5)
    )
    rect(
      ybottom = 0+(i-1) + (i/nrow(dat)),
      ytop = i + (i/nrow(dat)),
      xleft = 0,
      xright = tmp$proportion,
      col = adjustcolor("chartreuse4", alpha.f = 0.5)
    )
    text(
      x = -2.3,
      y = mean(
        c(0+(i-1) + (i/nrow(dat)),
          i + (i/nrow(dat)))
      ),
      labels = dat[i, "zone"],
      cex = 1.2
    )
  }

  dev.off()

}
