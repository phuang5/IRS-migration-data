######################################################
##
## IRS County-to-County Migration Data Version 2.0
##       Master Script
##
## Authors: Peng Huang, peng.huang@uga.edu
##
## Last updated: 10/09/2024
##
## Based on Hauer & Byars (2019)
##
######################################################

# This is a master script that calls other scripts one-by-one to replicate the 
# data production. 

# Step 0. Prepare the R session
source("R/000-libraries.R")

# Step 1. Download the IRS data
source("R/001-download_data.R")

# Step 2. Process the IRS data
source("R/002-flatten_data.R")
