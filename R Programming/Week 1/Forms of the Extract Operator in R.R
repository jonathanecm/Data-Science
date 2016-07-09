# Forms of the Extract Operator in R

## Extracting elements form a vector. 
### Extractor ([]) used to extract content from vectors, lists, or data frames. 
####Using [] with direct refering of elemets. 

x <- 16:30 # vector definition
x[13:15] # Extracting the last thre elements (13 to 15) from the vector. 

#### Using [] with the length of the object to calculate the indexes.

x[(length(x) - 2): length(x)]

## Extracting elements from a data frame. 
### Approach 1: Using [] to extract files from a data frame as a vector (a data frame is also a list.)

col <- "cyl" # Assingning the column name to an object. 
mtcars[[col]]

### Aproach 2: Use the name in column dimesion of the data frame.

mtcars[,col] # Selecting all the rows of the column.

### Aproach 3: Using the $ form of the stractor operator through the name of the column.
mtcars$cyl

## Advanced subsetting using the extractor operator. 
### Subsetting columns. 

#### Aproach 1: Subsetting with columns' numbers.
mtcars[, 1:3]

#### Aproach 2: Subsetting with columns' names. 
columns <- c("mpg", "cyl", "disp") # Creates a vector with the names of the columns to extract. 
mtcars[, columns] # Extracts the columns in the vector "columns."

### Subsetting rows. 
#### Aproach 1: Use ecact row references. 

mtcars[20:22, ]

#### Aproach 2: Use logic in the row dimension of reference.
mtcars[mtcars$cyl == 4 & mtcars$am == 1,] # Gets all the rows according to the logical expressions in all the columns.
                                          

mtcars[mtcars[, "cyl"] == 4, ] # subsets all the rows where the columns are equal to 4.

#### Aproach 3: use wich() function to extract indices. 
rows_subset <-  which(mtcars$cyl == 4) # Extracting the indices from the column "cyl" with rows' values equal to 4.
mtcars[rows_subset,]

#### Aproach 4: Using output from a fuction that returns a logical array instead of row numbers.
mtcars[!is.na(mtcars[, "cyl"]),] # Extracts all the rows that does not containg null values in the column "cyl."

