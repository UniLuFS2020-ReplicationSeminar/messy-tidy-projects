# Tidy Data Project
# Andrea De Angelis
# 7th of June 2019

# This scripts sets up the data analysis' project:
# - Sources setup scripts
# - Makes data wrangling
# - Stores tidy dataset in /output/DSP_recoded.Rdata

# Source setup scripts:
source(here::here("src","00_setup.R"))

# Folder structure:
# - Tidy Data Project/ 
# |------ src/
# |------ data/
# |------ doc/ 
# |------ figs/
# |------ output/
# |------ junk/

# Working directory from .Rproj
here::here("")

# Load data:
load(here::here("data","DSP_original.Rdata"))

# Copy the original data (not to overwrite):
DSP_rec <- DSP_Dataset_v1

# Select only certain variables
DSP_rec <- DSP_rec %>% 
     select(country_name, country_text_id, country_id, year, 
            v2smgovdom, v2smgovdom, v2smgovsmmon, v2smregcon, 
            v2smonper, v2smmefra, v2smhargr_0, v2smhargr_1, 
            v2smhargr_2, v2smhargr_6, v2smarrest_ord, v2smpolsoc, v2smpolhate_ord)

# Transform the data:
DSP_rec <- DSP_rec %>% 
                    mutate(
                         # Convert country and year to factor
                         country_name = as.factor(country_name),
                         year = as.factor(year),
                         
                         # Flip reversed-coded variable
                         v2smpolsoc = v2smpolsoc*(-1)
                    )

# Save recoded dataset
save(DSP_rec, file = here::here("output","DSP_recoded.Rdata"))
