frames <- list(data.frame(a = 1:10, b = 21:30), data.frame(a = 11:15, b = 31:35))
results <- list(a = numeric(), b = numeric())
start.a <- start.b <- end.a <- end.b <- 0
    
for(index in seq_along(frames)) {
    values <- frames[[index]]
    size.a <- length(values$a)
    size.b <- length(values$b)
    
    if(size.a > 0) {
        start.a <- end.a + 1 
        end.a <- start.a + size.a - 1
        results$a[start.a:end.a] <- values$a
    }
    
    if(size.b > 0) {
        start.b <- end.b + 1 
        end.b <- start.b + size.b - 1
        results$b[start.b:end.b] <- values$b
    }
}

values <- numeric()

for(index in seq_along(frames)) {
    frame <- frames[[index]]
    value <- mean(frame$a) + mean(frame$b)
    values[index] <- value
}
