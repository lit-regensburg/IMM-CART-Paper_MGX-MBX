#!/usr/bin/env R

# installs packages from github
#
# There is a very restrictive rate limit for unauthorized requests, so in order
# to build the container you probably have to obtain a github token by calling
# usethis::create_github_token()
# or on https://github.com/settings/tokens
# then set the environment variable GITHUB_TOKEN accordingly
#
# IMPORTANT: IF you decide to use a github token, make sure to
#   - create it just for this purpose
#   - delete it afterwards
# as OTHERWISE, your token will leak into the container and anyone with access can
# act on your behalf on github using the container!
#

if (Sys.getenv("GITHUB_TOKEN") == "") {
  warning("no github token set")
  token = ""
} else {
  token = Sys.getenv("GITHUB_TOKEN")
  # warning(paste("This is the Token used:", Sys.getenv("GITHUB_TOKEN")))
}
if (!require(devtools)) {
    stop("The devtools package must be installed to install GitHub packages")
}

github_pkgs <- read.delim("packages_github.csv", sep="\n", header=FALSE)[["V1"]]

for( pkg in github_pkgs ) {
  devtools::install_github(pkg, auth_token = token)
}
