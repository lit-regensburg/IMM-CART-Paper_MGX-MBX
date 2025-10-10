#!/usr/bin/env R

# installs packages from cran listed in packages_cran.csv and from bioconductor in packages_bioc.csv
bioc_pkgs <- read.delim("packages_bioc.csv", sep="\n", header=FALSE)[["V1"]]

if (!require("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}

# BiocManager::install(version = Sys.getenv("BIOC_VERSION"), ask = FALSE)
BiocManager::install(bioc_pkgs, ask = FALSE)
