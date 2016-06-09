# Using indices to create vectors. 

a <- 1:10
x <- 11:20

start <- length(a) + 1
end <- start + length(x) - 1

a[start:end] <- x
a

#Example of using vectors in a loop.

#Simulated data in a list
a <- 1:10
b <- 11:15
c <-  numeric()
vectors <- list(a = a, b = b, c = c)

# Result vector.
results <- numeric()

# Initialization of start and end vectors.
start <- end <- 0

# Vectors whithin a loop.

for (index in seq_along(vectors)) {
    values <- vectors[[index]]
    values
}

#Simulated data in a list
a <- 1:10
b <- 11:15
c <-  numeric()
vectors <- list(a = a, b = b, c = c)

# Result vector.
results <- numeric()

# Initialization of start and end vectors.
start <- end <- 0

# Vectors whithin a loop.

for (index in seq_along(vectors)) {
    values <- vectors[[index]]
    size <- length(values)
    
    if (size > 0) {
        start <- end + 1
        end <- start + size - 1 
        results[start:end] <- values
    }
}




