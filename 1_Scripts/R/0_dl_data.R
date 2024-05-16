#' Download and extract ecozone data
#'
#' @return

dl_ecozones <- function(filename = import_config()$ecozones_zipfile,
                        datadir = import_config()$raw_data_path) {

  # Download the ecozone data
  # Specify the URL of the file you want to download
  url <- "https://sis.agr.gc.ca/cansis/nsdb/ecostrat/zone/ecozone_shp.zip"

  # Create directory if it doesn't exist
  chk_dir(datadir)
  # Call the download.file() function, passing in the URL and file name/location as arguments
  download.file(url, sprintf("%s/%s.zip", tempdir(), filename), mode = "wb")

  # Unzip the folder
  unzip(sprintf("%s/%s.zip", tempdir(), filename), exdir = here::here(datadir))

}


#' Download and extract protected areas 
#' 
#' @export

dl_protected_areas <- function(filename = import_config()$protected_zipfile,
                               datadir = import_config()$raw_data_path) {

  # Download the protected areas data
  # Specify the URL of the file you want to download
  url <- "https://data-donnees.az.ec.gc.ca/api/file?path=/species%2Fprotectrestore%2Fcanadian-protected-conserved-areas-database%2FDatabases%2FAireProtegeeConservee_2023.zip"

  # Create directory if it doesn't exist
  chk_dir(datadir)
  # Call the download.file() function, passing in the URL and file name/location as arguments
  download.file(url, sprintf("%s/%s.zip", tempdir(), filename), mode = "wb")

  # Unzip the folder
  unzip(sprintf("%s/%s.zip", tempdir(), filename), exdir = here::here(datadir))

}