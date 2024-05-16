# Script that is pipeline of evenness index calculation for each year and inputted parameters

source("1_Scripts/R/0_get_ecozone.R")
source("1_Scripts/R/0_get_protected_area.R")
source("1_Scripts/R/1_compute_prop_protected_areas.R")
source("1_Scripts/R/1_filter_protection_level.R")

eco_areas_file_name -> get_ecozone()
protected_areas_file_name -> get_protected_areas()
