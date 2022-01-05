
# install developmental version with all deps
install.packages("pak", repos = "https://r-lib.github.io/p/pak/devel/", depedencies = TRUE)
# install a pre-compiled version
install.packages("odbc", repos = "https://packagemanager.rstudio.com/cran/__linux__/centos7/latest")

# get this installation out of the way
pak::pkg_install("pkgdepends", dependencies = TRUE)

hard_pkgs <- c(
# tidyverse installs all Imports in
# https://github.com/tidyverse/tidyverse/blob/main/DESCRIPTION
  "tidyverse",
  "covr",
  "cpp11",
  "data.table",
  "Rcpp",
  "testthat",
  NULL
)

# add versions once implemented
soft_pkgs <-  c(
#   "connections",
  "DBI",
  "devtools",
  "DT",
  "feather",
  "fs",
  "generics",
  "glue",
  "gt",
  "httr2",
  "kableExtra",
  "keyring",
  "knitr",
  "odbc",
  "openxlsx",
  "reticulate",
  "rmarkdown",
  "spelling",
  NULL
)

other_pkgs <- c(
  "github::jmbarbone/mark",      # for development version
  "github::jmbarbone/markExtra", # not on CRAN
  "github::jmbarbone/Rprofile",  # not on CRAN
  NULL
)

pak::pkg_install(hard_pkgs,  upgrade = FALSE, dependencies = "hard")
pak::pkg_install(soft_pkgs,  upgrade = FALSE, dependencies = "soft")
pak::pkg_install(other_pkgs, upgrade = FALSE, dependencies = "soft")

