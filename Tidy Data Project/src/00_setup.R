# Tidy Data Project
# Andrea De Angelis
# 18th of March 2020

# This scripts sets up the data analysis' project:
# - installing (or loading) the needed packages 
# - sourcing the needed functions

# Credits: part of the code is from Kruschke (2014) Doing Bayesian Data
# Analysis. A Tutorial with R, JAGS, and Stan.
# browseURL("https://www.amazon.de/Doing-Bayesian-Data-Analysis-Tutorial/dp/0124058884")

# Installing packages ---------------------------------------------------------------------------------

want = c("here","stargazer","rio","lme4", "tidyverse")   # list of required packages
have = want %in% rownames(installed.packages())
if ( any(!have) ) { install.packages( want[!have] ) }

# Attaching the needed packages
lapply(want, library, character.only = TRUE)

# Sourcing needed functions ---------------------------------------------------------------------------
source(here::here("src","00_functions.R"))
rm(have, want)