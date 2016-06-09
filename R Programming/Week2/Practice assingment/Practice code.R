weightmedian <- function(directory, day) {
    files <- list.files(directory, full.names = TRUE)
    dat <- data.frame()
    for (index in seq_along(files)) {
        dat <- rbind(dat, read.csv(files[index]))
    }
    sub <- data.frame()
    sub <- dat[dat$Day == day, ]
    result <- mean(sub[, "Weight"], na.rm = TRUE)
    return(result) 
}
