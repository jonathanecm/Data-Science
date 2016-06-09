# Function "pollutantmean." 

pollutantmean <- function(directory, pollutant, id = 1:332) {
    all_files <- list.files(directory, full.names = TRUE)
    dat <- data.frame()
    i <- id
    for (i in id) {
        dat <- rbind(dat, read.csv(all_files[i]))
    }
    subset <- dat[, pollutant]
    mean <- mean(subset, na.rm = TRUE)
    return(mean)
}



