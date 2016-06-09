vector <- vector_squared <- numeric()
v1 <- c(4, 5, 6)

index <- 1
for (variable in v1) {
    vector[index] <- variable
    vector_squared[index] <- variable ^ 2
    index <- index + 1
}

data <- data.frame(vector, vector_squared, row.names = LETTERS[vector])


