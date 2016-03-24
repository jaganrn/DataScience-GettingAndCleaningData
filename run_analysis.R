# Getting and Cleaning Data Course Project
#
# This program demonstrates the cleaning of tidy dataset that can be used for subsequent data analysis. This
# script named run_analysis.R, does the following:
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
#    each variable for each activity and each subject.


# common environment setup
library(data.table)  # load the data.table library
setwd("C:/usr/jagan/DataScience/GettingAndCleaningData/Project")  # set the working directory

#
#1. Merges the training and the test sets to create one data set
#

# read data from files
subjectTrain     = read.table("./UCI HAR Dataset/train/subject_train.txt")
xTrainFeatures   = read.table("./UCI HAR Dataset/train/x_train.txt")
yTrainActivities = read.table("./UCI HAR Dataset/train/y_train.txt")

subjectTest      = read.table("./UCI HAR Dataset/test/subject_test.txt")
xTestFeatures    = read.table("./UCI HAR Dataset/test/x_test.txt")
yTestActivities  = read.table("./UCI HAR Dataset/test/y_test.txt")

# read the labels
features       = read.table("./UCI HAR Dataset/features.txt") 
activityLabels = read.table("./UCI HAR Dataset/activity_labels.txt") 

# set column names 
colnames(subjectTrain)     = colnames(subjectTest)     = "subjectId"
colnames(yTrainActivities) = colnames(yTestActivities) = "activityId"
colnames(xTrainFeatures)   = colnames(xTestFeatures)   = features[, 2]; 
colnames(activityLabels)   = c("activityId", "activityLabel")


# generate the combined traning data
combinedTrainingData = cbind(yTrainActivities, subjectTrain, xTrainFeatures)

# generate the combined test data
combinedTestData = cbind(yTestActivities, subjectTest, xTestFeatures)

# merge the training & test data
mergedData = rbind(combinedTrainingData, combinedTestData)

#
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 

# create a logicalVector that contains TRUE values for required fields
lvRequiredFields = grepl("^activityId|^subjectId|-(mean|std)\\(\\)$", colnames(mergedData))

# extract only the mean & standard deviation
mergedData = mergedData[lvRequiredFields==TRUE]

#
# 3. Uses descriptive activity names to name the activities in the data set
#

# Merge the mergedData set with the acitivityType table to include descriptive activity names
mergedData = merge(mergedData, activityLabels, by="activityId", all.x=TRUE)

# 4. Appropriately labels the data set with descriptive variable names.

# get the list of columns into a vector for easy manipulation
columnNames  = colnames(mergedData)

# label the column names
for (i in 1:length(columnNames)) 
{
    columnNames[i] = gsub("\\()", "", columnNames[i])
    columnNames[i] = gsub("-std$", "StdDev", columnNames[i])
    columnNames[i] = gsub("-mean", "Mean", columnNames[i])
    columnNames[i] = gsub("^(t)", "Time", columnNames[i])
    columnNames[i] = gsub("^(f)", "Freq", columnNames[i])
    columnNames[i] = gsub("BodyBody|Body", "Body", columnNames[i])
    columnNames[i] = gsub("JerkMag", "JerkMagnitude", columnNames[i])
    columnNames[i] = gsub("AccMag", "AccelerationMagnitude", columnNames[i])
    columnNames[i] = gsub("GyroMag", "GyroMagnitude", columnNames[i])
}

# set the new descriptive column names 
colnames(mergedData) = columnNames

#
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
#    each variable for each activity and each subject.

#compute the mean for each of the variables for each of the subject & activities
finalResult = aggregate(mergedData[, names(mergedData) != c("activityId", "subjectId", "activityLabel")], by=list(activityId=mergedData$activityId, subjectId = mergedData$subjectId, activityLabel=mergedData$activityLabel), mean)

# flush out the results
write.csv(finalResult, "./projectResultsData.csv")

