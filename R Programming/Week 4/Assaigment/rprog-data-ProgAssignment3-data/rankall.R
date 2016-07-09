#source("best.R") # Call best function.

rankhospital <- function(state, outcome, num = "best"){
    if (num == "best") {
        outcomes <- c("heart attack"= 11, "heart failure" = 17, "pneumonia" = 23)
        if (!outcome %in% names(outcomes)){
            stop("invalid outcome")
        }
        outcome_index <- outcomes[[outcome]]
        dat <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
        if (!state %in% dat$State) {
            stop("invalid state")
        }
        subset <- na.omit(dat[, c(2, 7, outcome_index)])
        subset_list <- split(subset, subset$State)
        subset_by_hospital <- subset_list[[state]]
        order <- subset_by_hospital[order(subset_by_hospital[,3], subset_by_hospital[, 1]),]
        order[1, 1]
    } else if (num == "worst") {
        outcomes <- c("heart attack"= 11, "heart failure" = 17, "pneumonia" = 23)
        if (!outcome %in% names(outcomes)){
            stop("invalid outcome")
        }
        outcome_index <- outcomes[[outcome]]
        dat <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
        if (!state %in% dat$State) {
            stop("invalid state")
        }
        subset <- na.omit(dat[, c(2, 7, outcome_index)])
        subset_list <- split(subset, subset$State)
        subset_by_hospital <- subset_list[[state]]
        order <- subset_by_hospital[order(subset_by_hospital[,3], subset_by_hospital[, 1]),]
        as.vector(tail(order, 1))
    } else {
        outcomes <- c("heart attack"= 11, "heart failure" = 17, "pneumonia" = 23)
        if (!outcome %in% names(outcomes)){
            stop("invalid outcome")
        }
        outcome_index <- outcomes[[outcome]]
        dat <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available", stringsAsFactors = FALSE)
        if (!state %in% dat$State) {
            stop("invalid state")
        }
        subset <- na.omit(dat[, c(2, 7, outcome_index)])
        subset_list <- split(subset, subset$State)
        subset_by_hospital <- subset_list[[state]]
        order <- subset_by_hospital[order(subset_by_hospital[,3], subset_by_hospital[, 1]),]
        #index <- 1
        total <- nrow(order)
        vector <- c(1:total)
        order$new.col <- vector
        order[num, 1]
        
    }
}