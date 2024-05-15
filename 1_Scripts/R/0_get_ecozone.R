library()

# Specify the URL of the file you want to download
url <- "https://sis.agr.gc.ca/cansis/nsdb/ecostrat/zone/ecozone_shp.zip"

# Specify the file name and location where you want to save the file on your computer
file_name <- "ecozone_shp.zip"
file_path <- "0_Data/"

# Call the download.file() function, passing in the URL and file name/location as arguments
download.file(url, paste(file_path, file_name, sep = ""), mode = "wb")

