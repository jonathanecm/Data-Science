#dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip" #Passes the url to a variable.
#download.file(dataset_url, "diet_data.zip") #Download the file to the wd.
#unzip("diet_data.zip", exdir = "diet_data") #Unzips the file.

#andy <- read.csv("Andy.csv")

#Subseting a value in the data frame. 
andy[which(andy$Day == 1), "Weight"]
andy[which(andy$Day == 30), "Weight"]
andy[which(andy[, "Day"] == 30), "Weight"]
subset(andy$Weight, andy$Day == 30)
andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]


files_full <- list.files("diet_data", full.names = TRUE) #Adds the full path to the name of the files.

#Concatenates the content of the second vatiable in vector files_full to the end of the rows in andy. 
andy_david <- rbind(andy, read.csv(files_full[2]))
        
#Subsets the data frame andy_david data points that have as day 25.
day_25 <- andy_david[which(andy_david$Day == 25), ]

#Loop to add all the files into a sigle data frame. 
dat <- data.frame()
for (i in 1:5) {
  dat <- rbind(dat, read.csv(files_full[i]))
}

#Calculates the mean of the column "Weight" of the data frame.
median(dat$Weight, na.rm = TRUE)

#Subsets the data frame dat in the column "Day" that are equal to 30.
dat_30 <- dat[which(dat[, "Day"] == 30),]

#Calculates the mean of the weights.
median(dat_30$Weight)

#Function that gets two arguments (directory, and day) and returns the mean accoding to the given parameters.
weightmedian <- function(directory, day) {
    files_list <- list.files(directory, full.names = TRUE)
    dat <- data.frame()
    r <- read.csv("diet_data/Andy.csv")
    for (i in 1:5) {
        dat <- rbind(dat, read.csv(files_list[i]))
    }
    dat_subset <- dat[which(dat[, "Day"] == day), ]
    median(dat_subset[, "Weight"], na.rm = TRUE)
}



