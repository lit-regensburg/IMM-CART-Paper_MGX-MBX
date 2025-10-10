#!/usr/bin/env R

# installs packages from cran listed in packages_cran.csv and from bioconductor in packages_bioc.csv
cran_pkgs <- read.delim("packages_cran.csv", sep="\n", header=FALSE)[["V1"]]

install.packages(cran_pkgs, repos = "https://packages.othr.de/cran/")
