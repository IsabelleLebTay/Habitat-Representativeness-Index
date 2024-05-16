#' Import config file
#' 
#' @export

import_config <- function(config = ".config.yml") {
  yaml::read_yaml(config)
}


#' Check if directory is created, and if not, create it
#' 
#' @export

chk_dir <- function(dirname) {
  if(!dir.exists(here::here(dirname))) dir.create(here::here(dirname))
}

#' Check crs
#' 
#' @export

chk_crs <- function(dat, crs = import_config()$crs) {
  if(sf::st_crs(dat) != sf::st_crs(crs)) return(sf::st_transform(dat, crs))
  return(dat)
}
