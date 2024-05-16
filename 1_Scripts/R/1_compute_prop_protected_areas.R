library(sf)

ecozone <- st_read('0_Data/ecozone_shp/Ecozones/ecozones.shp')
protected_area_layers <- st_layers('0_Data/protected_areas/ProtectedConservedArea_2023/ProtectedConservedArea_2023.gdb/')
conserved_protected_area <- st_read('0_Data/protected_areas/ProtectedConservedArea_2023/ProtectedConservedArea_2023.gdb/',
                            layer = 'ProtectedConservedArea_2023')


colnames(conserved_protected_area)
unique(conserved_protected_area$IUCN_CAT)

colnames(ecozone)
conserved_protected_area

head(ecozone)
head(conserved_protected_area)

# To do: 
# Define what is the good CRS
# Ensure both datasets have the same CRS
# Join and intersect 
# Compute sum of total protected area per ecozone, 
# Compute sum of each protected area per ecocone
# Compute ecozone area
# Make a tbl with result


# not working
# cp_areas <- st_transform(conserved_protected_area, st_crs(ecozone))
# 
# 
# # Perform the spatial join with "left" join and "intersects" predicate
# joined_d <- st_join(cp_areas, 
#                     ecozone, 
#                     join = st_intersects, left = TRUE)




