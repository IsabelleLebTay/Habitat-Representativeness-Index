#' Compute proportion of protected areas
#' 
#' @return

prop_protected_areas <- function(unit = "ecozones", zone = "ZONE_NAME") {

  # Download data
  if(unit == "ecozones") dat <- read_ecozones()
  protected_areas <- read_protected_areas()

  # Check if both are MULTIPOLYGON geometry type
  dat <- sf::st_cast(dat, "MULTIPOLYGON")
  protected_areas <- sf::st_cast(protected_areas, "MULTIPOLYGON")

  # Intersects both spatial object
  intersected_dat <- terra::intersect(
    dat |> terra::vect(),
    protected_areas |> terra::vect()
  )

  # Create table to store informations about areas
  df <- data.frame(
    zone = unique(dat[,zone, drop = TRUE]),
    total_area = NA,
    protected_area = NA,
    proportion = NA
  )

  # Fill in table
  for(i in 1:nrow(df)) {
    tmp <- dat[dat[,zone, drop = TRUE] %in% df[i,"zone"],] |> terra::vect()
    tmp_protected <- intersected_dat[intersected_dat[,zone, drop = TRUE][,1] %in% df[i,"zone"],]
    df[i, "total_area"] <- terra::expanse(tmp, unit = "km") |> sum()
    df[i, "protected_area"] <- terra::expanse(tmp_protected, unit = "km") |> sum()
    df[i, "proportion"] <- df[i,"protected_area"]/df[i, "total_area"]
  }

  # Create output directory if it doesn't exist
  chk_dir(import_config()$output_path)
  write.csv(
    df,
    sprintf("%s/%s_%s", 
            import_config()$output_path,
            unit,
            import_config()$proportion_df),
    row.names = FALSE
  )

}
