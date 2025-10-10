# Preprocessing Helper Functions

# Helper functions for NA imputation

library(GSimp)

# Adds a randomisation to a HM like NA imputation - adjusted from Alexander Cecil via Alix Schwarz
HMrand_wrapper <- function(data) {
  # Compute replacement values for each column
  replacer <- apply(data, 2, function(col) {
    min(col[col != 0] / sqrt(2), na.rm = TRUE)
  })
  
  # Replace NA values with random values within a range
  for (i in seq_along(data)) {
    na_indices <- which(is.na(data[, i]))
    if (length(na_indices) > 0) {
      data[na_indices, i] <- runif(length(na_indices),
                                   min = ifelse(replacer[i] > 0, replacer[i] * 0.75, replacer[i] * 1.25),
                                   max = ifelse(replacer[i] > 0, replacer[i] * 1.25, replacer[i] * 0.75)
      )
    }
  }
  return(data)
}


impute_NAs <- function(data, method = "zero") {
  if (!(method %in% c("HM", "HMrand", "QRILC", "GSimp", "zero"))) {
    stop("'method' has to be one of 'HM', 'HMrand', 'QRILC' or 'GSimp'")
  }
  if (method == "HM") {
    result <- HM_wrapper(data)
  }
  if (method == "HMrand") {
    result <- HMrand_wrapper(data)
  }
  if (method == "QRILC") {
    result <- QRILC_wrapper(data)
  }
  if (method == "GSimp") {
    result <- pre_processing_GS_wrapper(data, cores = 1)
  }
  if (method == "zero") {
    result <- Zero_wrapper(data)
  }
  return(result)
}
