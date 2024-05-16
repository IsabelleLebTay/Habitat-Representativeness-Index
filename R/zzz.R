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
