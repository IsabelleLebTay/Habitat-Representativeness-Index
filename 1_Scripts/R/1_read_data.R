#' Download and extract ecozone data
#'
#' @return

read_ecozones <- function(filename = import_config()$ecozones_data,
                        datadir = sprintf("%s/%s",
                                          import_config()$raw_data_pat,
                                          import_config()$ecozones_data_path),
                        crs = import_config()$crs) {

  dat <- sf::st_read(here::here(sprintf("%s/%s", datadir, filename)))

  dat <- chk_crs(dat)

  return(dat)

}


#' Download and extract protected areas dat
#' 
#' @export

read_protected_areas <- function(filename = import_config()$protected_data,
                               datadir = sprintf("%s/%s",
                                                 import_config()$raw_data_pat,
                                                 import_config()$protected_data_path),
                               layer = import_config()$protected_layer,
                               crs = import_config()$crs) {

  dat <- sf::st_read(
    here::here(sprintf("%s/%s", datadir, filename)),
    layer = layer
  )

  dat <- chk_crs(dat)
  
  return(dat)

}
