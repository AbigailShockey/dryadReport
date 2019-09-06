library(rmarkdown)

# Get command line arguments
args = commandArgs(trailingOnly=TRUE)

# Read inputs
species <- args[1]
num.iso <- args[2]
snp.mat <- read.table(args[3], header = T)
nwk <- args[4]

# Render the report
render('anlaysis_report.Rmd', output_file='analysis_report.html')
