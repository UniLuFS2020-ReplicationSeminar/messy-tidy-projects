# Tidy Data Project
# Andrea De Angelis

# This scripts lists examples of utility functions to be sourced

# Function to compute logit trasnformation ----------------------------------
logit <- function(p){
     log(p/(1 - p))
}

# Function to compute inverse-logit transformation --------------------------
invlogit <- function(x) { 1/(1 + exp(-x)) }



