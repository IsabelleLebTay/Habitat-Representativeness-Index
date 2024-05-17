#' Compute proportion of protected areas
#' 
#' @return

prop_protected_areas <- function(unit = "ecozones", zone = "ZONE_NAME") {

  # Download data
  if(unit == "ecozones") dat <- read_ecozones()
  protected_areas <- read_protected_areas()

<<<<<<< HEAD
  # Filter for terrestrial
  protected_areas <- protected_areas[protected_areas$BIOME == "T",]

=======
<<<<<<< HEAD
=======
  # Filter for terrestrial
  protected_areas <- protected_areas[protected_areas$BIOME == "T",]

>>>>>>> 74796878323ff62fb377473f87b7285b4b5af087
>>>>>>> b4a18b9af986b026e159ac010d35147fa845730f
  # Check if both are MULTIPOLYGON geometry type
  dat <- sf::st_cast(dat, "MULTIPOLYGON")
  protected_areas <- sf::st_cast(protected_areas, "MULTIPOLYGON")

  # Intersects both spatial object
  intersected_dat <- terra::intersect(
    dat |> terra::vect(),
    protected_areas |> terra::vect()
  )

<<<<<<< HEAD
  year2020 <- intersected_dat$QUALYEAR <= 2020
  na_year <- is.na(intersected_dat$QUALYEAR)
  intersected_dat[year2020, "QUALYEAR"] <- 2020
  intersected_dat[na_year, "QUALYEAR"] <- intersected_dat[na_year, "ESTYEAR"]
  intersected_dat[is.na(intersected_dat$QUALYEAR), "QUALYEAR"] <- 2020

  # Fill table
  df <- lapply(2020:2023, function(x) {
    
    # Create table to store informations about areas
    df <- data.frame(
      zone = unique(dat[,zone, drop = TRUE]),
      year = x,
      total_area = NA,
      protected_area = NA,
      proportion = NA
    )
=======
<<<<<<< HEAD
  # Create table to store informations about areas
  df <- data.frame(
    zone = unique(dat[,zone, drop = TRUE]),
    total_area = NA,
    protected_area = NA,
    proportion = NA
  )
>>>>>>> b4a18b9af986b026e159ac010d35147fa845730f

    # Fill it
    # Filter for time
    intersected_dat_year <- intersected_dat[intersected_dat$QUALYEAR <= x,]
    for(i in 1:nrow(df)) {
      tmp <- dat[dat[,zone, drop = TRUE] %in% df[i,"zone"],] |> terra::vect()
      tmp_protected <- intersected_dat_year[intersected_dat_year[,zone, drop = TRUE][,1] %in% df[i,"zone"],]
      df[i, "total_area"] <- terra::expanse(tmp, unit = "km") |> sum()
      df[i, "protected_area"] <- terra::expanse(tmp_protected, unit = "km") |> sum()
      df[i, "proportion"] <- df[i,"protected_area"]/df[i, "total_area"]
      
    }
  }) |>
    do.call(what = rbind, args = _)

  # Create output directory if it doesn't exist
  chk_dir(import_config()$output_path)
<<<<<<< HEAD
  # Save table
=======
=======
  year2020 <- intersected_dat$QUALYEAR <= 2020
  na_year <- is.na(intersected_dat$QUALYEAR)
  intersected_dat[year2020, "QUALYEAR"] <- 2020
  intersected_dat[na_year, "QUALYEAR"] <- intersected_dat[na_year, "ESTYEAR"]
  intersected_dat[is.na(intersected_dat$QUALYEAR), "QUALYEAR"] <- 2020

  # Fill table
  df <- lapply(2020:2023, function(x) {
    
    # Create table to store informations about areas
    df <- data.frame(
      zone = unique(dat[,zone, drop = TRUE]),
      year = x,
      total_area = NA,
      protected_area = NA,
      proportion = NA
    )

    # Fill it
    # Filter for time
    intersected_dat_year <- intersected_dat[intersected_dat$QUALYEAR <= x,]
    for(i in 1:nrow(df)) {
      tmp <- dat[dat[,zone, drop = TRUE] %in% df[i,"zone"],] |> terra::vect()
      tmp_protected <- intersected_dat_year[intersected_dat_year[,zone, drop = TRUE][,1] %in% df[i,"zone"],]
      df[i, "total_area"] <- terra::expanse(tmp, unit = "km") |> sum()
      df[i, "protected_area"] <- terra::expanse(tmp_protected, unit = "km") |> sum()
      df[i, "proportion"] <- df[i,"protected_area"]/df[i, "total_area"]
      
    }
  }) |>
    do.call(what = rbind, args = _)

  # Create output directory if it doesn't exist
  chk_dir(import_config()$output_path)
  # Save table
>>>>>>> 74796878323ff62fb377473f87b7285b4b5af087
>>>>>>> b4a18b9af986b026e159ac010d35147fa845730f
  write.csv(
    df,
    sprintf("%s/%s_%s", 
            import_config()$output_path,
            unit,
            import_config()$proportion_df),
    row.names = FALSE
  )

}
