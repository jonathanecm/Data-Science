# Corr function alculates the correlation between Nitrogen and Sulfate variables.

corr <- function(directory, threshold = 0) {
    all_files <- list.files(directory, full.names = TRUE)
    correlation <- numeric()
    index <- 1
    for (i in seq_along(all_files)) {
        file <- read.csv(all_files[i])
       if ((sum(complete.cases(file)) > threshold)) {
            sulfate <- file$sulfate
            nitrate <- file$nitrate
            correlation[index] <- cor(sulfate, nitrate, use = "complete.obs")
            index <- index + 1
          }
    }
    return(correlation)
}
