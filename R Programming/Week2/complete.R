# Function "complete."

complete <- function(directory, id = 1:332) {
    all_files <- list.files(directory, full.names = TRUE)
    dat <- data.frame()
    dataframe <- data.frame()
    i <- id
    complete_cases <- vector()
    for (i in id) {
            dat <- read.csv(all_files[i])
            complete_cases <- c(complete_cases, sum(complete.cases(dat)))
    }
    dataframe <- data.frame(cbind(id, complete_cases))
    names(dataframe) <- c("id", "nobs")
    return(dataframe)
}



