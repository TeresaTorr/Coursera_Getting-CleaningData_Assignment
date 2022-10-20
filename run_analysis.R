
# Downloading the dataset:

Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataset <- "./Coursera_Getting-CleaningData_Assignment/dataset.zip"

download.file(Url, destfile="dataset")


# Unzipping:
unzip("dataset", exdir=".")

# Reading the data:
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")



# 1.Merges the training and the test sets to create one data set:

testdata  <- cbind(subject_test, y_test, x_test)
traindata <- cbind(subject_train, y_train, x_train)

str(testdata); str(traindata) # having a look at the data

completeSet <- rbind(testdata, traindata)



# 2.Extracts only the measurements on the mean and standard deviation for each measurement:

# From features we extract the names that include "mean" and "std":

sfeatures <- as.character(features[,2]) # we create a v with the second column as char

sCols <- grep("-(mean|std).*", sfeatures) # selecting those with mean or std in the names



# 3.Uses descriptive activity names to name the activities in the data set:

sColNames <- features[sCols, 2] # we get the actual names

# We update de complete set:

completeSet1 <- completeSet[,1:2]
completeSet2 <- completeSet[,3:ncol(completeSet)]

completeSet2 <- completeSet2[sCols]

completeSet <- cbind(completeSet1, completeSet2)



# 4.Appropriately labels the data set with descriptive variable names:

sColNames <- gsub("Acc", "Acceleration", sColNames)
sColNames <- gsub("-mean", "Mean", sColNames)
sColNames <- gsub("-std", "Std", sColNames)
sColNames <- gsub("[-()]", "", sColNames)

colnames(completeSet) <- c("Subject", "Activity", sColNames)



# 5.Creating a new dataset with the average of each variable for each activity and each subject:

library(reshape2)


#Create the obs for each activity and each subject:
meltedSet <- melt(completeSet, id = c('Subject', 'Activity')) 

#Calculate the means for each activity and subject:
meltedSetMean <- dcast(meltedSet, Subject + Activity ~ variable mean)

#Creat the file:
write.table(meltedSetMean, file=file.path("tidy.txt"), row.names = FALSE, quote = FALSE)

