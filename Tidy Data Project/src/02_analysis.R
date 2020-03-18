# Tidy Data Project
# Andrea De Angelis

# This scripts analyze the data:
# - Sources setup scripts
# - Creates figures and stores them in /figs
# - Estimates the regression model2 "fm_govdom1-3"
# - Creates the table for the figures and stores them in /output/Table1.html

# Source setup scripts:
source(here::here("src","00_setup.R"))

# Load data:
load(here::here("output","DSP_recoded.Rdata"))


# Creating figures -----------------------------------------------------------------------------
# Check out this post for info:
# https://thepoliticalmethodologist.com/2013/11/25/making-high-resolution-graphics-for-academic-publishing/

# Figure 1 - monper
ggplot(DSP_rec) + 
     geom_histogram(mapping = aes(x = v2smonper), binwidth = 0.2) + 
     labs(title = "Histogram of v2smonper", x  = "") + 
     theme_bw()
# Save the plot:
ggsave(filename = here::here("figs", "Fig1_monper.tiff"),
       device = "tiff", dpi = 600, compression = "lzw", 
       height = 5, width = 5, units = "in")


# Figure 2 - v2smgovsmmon
ggplot(DSP_rec) + 
     geom_histogram(mapping = aes(x = v2smgovsmmon), binwidth = 0.2) + 
     labs(title = "Histogram of v2smgovsmmon", x  = "") + 
     theme_bw()
# Save the plot:
ggsave(filename = here::here("figs", "Fig2_govsmmon.tiff"),
       device = "tiff", dpi = 600, compression = "lzw", 
       height = 5, width = 5, units = "in")

# Figure 3 - regcon
ggplot(DSP_rec) + 
     geom_histogram(mapping = aes(x = v2smregcon), binwidth = 0.2) + 
     labs(title = "Histogram of regcon", x  = "") + 
     theme_bw()
# Save the plot:
ggsave(filename = here::here("figs", "Fig3_regcon.tiff"),
       device = "tiff", dpi = 600, compression = "lzw", 
       height = 5, width = 5, units = "in")

# Figure 4 - scatter
ggplot(DSP_rec, mapping = aes(x = v2smgovdom, y = v2smregcon)) + 
     geom_point() + 
     geom_smooth() + 
     labs(title = "Scatterplot of v2smgovdom and v2smregcon", x  = "v2smgovdom", y = "v2smregcon") + 
     theme_bw()
# Save the plot:
ggsave(filename = here::here("figs", "Fig4_scatter.tiff"),
       device = "tiff", dpi = 600, compression = "lzw", 
       height = 5, width = 5, units = "in")


# Regression analysis ---------------------------------------------------------------------

# Model 1: baseline specification
fm_govdom1 <- lm(v2smgovdom ~ v2smregcon, data = DSP_rec)

# Model 2: adding country fixed-effects:
fm_govdom2 <- lm(v2smgovdom ~ v2smregcon + country_name, data = DSP_rec)

# Model 3: adding year fixed-effects
fm_govdom3 <- lm(v2smgovdom ~ v2smregcon + country_name + year, data = DSP_rec)

require(stargazer)
stargazer(fm_govdom1, fm_govdom2, fm_govdom3, 
          type = "html", style = "apsr", 
          out = here::here("output", "Table1.html"),
          omit = c("country_name", "year"), 
          add.lines = list(c("Country FE", "No", "Yes", "Yes"), 
                           c("Year FE", "No", "No", "Yes")))
