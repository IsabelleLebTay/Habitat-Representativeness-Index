# Specify the URL of the file you want to download
url <- "https://data-donnees.az.ec.gc.ca/api/file?path=/species%2Fprotectrestore%2Fcanadian-protected-conserved-areas-database%2FDatabases%2FProtectedConservedArea_2023.zip"

# Specify the file name and location where you want to save the file on your computer
file_name <- "protected_areas.gdb"
file_path <- "0_Data/"

# Call the download.file() function, passing in the URL and file name/location as arguments
download.file(url, paste(file_path, file_name, sep = ""), mode = "wb")

