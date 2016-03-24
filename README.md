## Getting and Cleaning Data Course Project

This project is done as part of Getting and Cleaning Data Coursera course project conducted by John Hopkins University through Coursera. This project demonstrate the cleaning of tidy dataset that can be used for subsequent data analysis. Detailed description of the dataset is available at [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The data used for this project is found at [data source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The R script named *run_analysis.R*, does the following:

1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


If you plan to run this script the following needs to be done:

1. Download the data and unzip into the folder named *UCI HAR Dataset* in the same directory where *run_analysis.R* is present
1. Change the path from C:/usr/jagan/DataScience/GettingAndCleaningData/Project to the directory where *run_analysis.R* is present
1. Result file is produced with the name *projectResultsData.csv* in the current working directory

Additional details about the data elements and transformations is available in *CodeBook.MD* file
