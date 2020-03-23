#!/usr/bin/env Rscript

library(rmarkdown)
library(tools)

# Get command line arguments
args = commandArgs(trailingOnly=TRUE)

# Read inputs
species <- args[1]
snp_mat <- read.table(file_path_as_absolute(args[2]), header = T)
nwk <- file_path_as_absolute(args[3])
output_path <- args[4]
ar_df <- args[5]
if (ar_df != "none") {
 read.table(file_path_as_absolute(ar_df, header = T, stringsAsFactors = F) 
 }
ar_mat <- args[6]
if (ar_mat != "none") {
 read.table(file_path_as_absolute(ar_mat, header = F, stringsAsFactors = F) 
 }

# Render the report
render('analysis_report.Rmd', output_file='analysis_report.pdf')
