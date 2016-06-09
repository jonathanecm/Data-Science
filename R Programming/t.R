# Dowload a file and unzips the file into a directory that is created
dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")

list.files("diet_data") #Lists the files  

andy <- read.csv("diet_data/John.csv") #Previews the content of the file 
head(andy)

length(andy$Weight) #Determining how many rows the files has. 
dim(andy) #Determines the dimensions of Andy
str(andy) #Compat summary of the data in Andy
summary(andy) #Returns a summary of common statistic indicators 
names(andy) #Return names in andy

andy[1, "Weight"] #Subsets the first row of andy's

andy[which(andy$Day == 30), "Weight"] #Subsetting the weight according to a logical opperator
andy[which(andy[, "Day"] == 30), "Weight"]
subset(andy$Weight, andy$Day == 30)

andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]
andy_loss <- andy_start - andy_end
andy_loss

files <- list.files("diet_data")
files

files[3]

files_full <- list.files("diet_data", full.names = TRUE) #Adding the path to the files
files_full

head(read.csv(files_full[3])) #Looking into the data of a file

andy_david <- rbind(andy, read.csv(files_full[2])) #Concatenate one file into the other by rows

day_25 <- andy_david[which(andy_david$Day == 25), ] #Subsets the instnaces or rows according to the lofical operator 
day_25

#Loop function that appends all the files to an object

dat <- data.frame() #Creates the data fram otherwise, the R will throug an error
for (i in 1:5) {
  dat <- rbind(dat, read.csv(files_full[i]))
}

median(dat$Weight, na.rm = TRUE) # Gets the median wile stripts the data from NA values. 

dat_30 <- dat[which(dat[, "Day"] == 30), ] #Gets the values of the data set according to Day column iqual to 30
dat_30
median(dat_30$Weight) #Calculates the midian of Weight

weightmedian <- function(directory, day) {  #Fuction that return the median on a given day of a data in an specific directory
  files_list <- list.files("diet_data", full.names = TRUE) #Passes all the files into a list. 
  dat <- data.frame()  #Creates an empty dataframe. 
  
  for (i in 1:5) {  # loops through the files binding them to one dataset
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  
  dat_subset <- dat[which(dat[, "Day"] == day), ]
  
}