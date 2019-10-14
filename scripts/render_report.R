#!/usr/bin/env Rscript

library(rmarkdown)
library(tools)

# Get command line arguments
args = commandArgs(trailingOnly=TRUE)

# Read inputs
output_path <- args[1]
species <- args[2]
num.iso <- args[3]
snp.mat <- read.table(file_path_as_absolute(args[4]), header = T)
nwk <- file_path_as_absolute(args[5])



# Render the report
render('anlaysis_report.Rmd', output_file='analysis_report.pdf')
