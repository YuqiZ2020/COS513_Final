# Required libs
library(dplyr)
library(reshape2)
library(kableExtra)
library(ggplot2)
library(gridExtra)
# Load mutSignatures
library(mutSignatures)

data_folder <- "TCGA-counts/"

# List all CSV files in the directory
csv_files <- list.files(path = data_folder, pattern = "\\.csv$", full.names = TRUE)

combined_count_data <- matrix()


for (file in csv_files) {
  temp = read.csv(file, check.names = FALSE, row.names = 1)
  combined_count_data <- cbind(combined_count_data,temp)
}

combined_count_data = combined_count_data[,-1]

count_data_obj = as.mutation.counts(combined_count_data)

# how many signatures should we extract? 
num.sign <- 

# Define parameters for the non-negative matrix factorization procedure.
# you should parallelize if possible
blca.params <- 
  mutSignatures::setMutClusterParams( 
    num_processesToExtract = num.sign,    # num signatures to extract
    num_totIterations = 50,               # bootstrapping: ausually 500-1000
    num_parallelCores = 4)                # total num of cores to use (parallelization)

# Extract new signatures - may take a while
blca.analysis <- 
  decipherMutationalProcesses(input = count_data_obj,
                              params = blca.params)

exp_mtx = as.data.frame(blca.analysis$Results$exposures)
sig_mtx = as.data.frame(blca.analysis$Results$signatures)

