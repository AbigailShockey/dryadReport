#!/usr/bin/env Rscript

library(rmarkdown)
library(tools)

# Get command line arguments
args = commandArgs(trailingOnly=TRUE)

# Read inputs
species <- args[1]
snp.mat <- read.table(file_path_as_absolute(args[2]), header = T)
nwk <- file_path_as_absolute(args[3])
output_path <- args[4]
ar_df <- args[5]

# Render the report
render('analysis_report.Rmd', output_file='analysis_report.pdf')
