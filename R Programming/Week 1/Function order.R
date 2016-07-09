# Using the function order() to sort the data frame by cyl and mpt. 

orderedData <- mtcars[order(mtcars$cyl, mtcars$mpg), ]
