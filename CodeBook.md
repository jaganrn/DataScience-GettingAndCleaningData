## Code Book for Getting and Cleaning Data Course Project

This Code Book describes the data elements produced by the R script named *run_analysis.R*, which was done as part a project work done for Getting and Cleaning Data Coursera course conducted by John Hopkins University through Coursera. Please go throgh [README file](https://github.com/jaganrn/DataScience-GettingAndCleaningData/blob/master/README.md) for more details on setting up the environment and executing the script

Also detailed description of the master dataset is available at [*"UCI Machine Learning Repository"*](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The data used for this project is found at [data source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


The following are the fields produced in the **projectResultsData.txt** file produced in the current working directory of the project. As the file extension indicate this file is COMMA separated with each record containing the mean variables for each of the activityId, subjectId, activityLabel combinations. Each row contain the following fields in order

1. activityId
1. subjectId
1. activityLabel
1. TimeBodyAccelerationMagnitudeMean	
1. TimeBodyAccelerationMagnitudeStdDev	
1. TimeGravityAccelerationMagnitudeMean	
1. TimeGravityAccelerationMagnitudeStdDev	
1. TimeBodyAccelerationJerkMagnitudeMean	
1. TimeBodyAccelerationJerkMagnitudeStdDev	
1. TimeBodyGyroMagnitudeMean	
1. TimeBodyGyroMagnitudeStdDev	
1. TimeBodyGyroJerkMagnitudeMean	
1. TimeBodyGyroJerkMagnitudeStdDev	
1. FreqBodyAccelerationMagnitudeMean	
1. FreqBodyAccelerationMagnitudeStdDev	
1. FreqBodyAccelerationJerkMagnitudeMean	
1. FreqBodyAccelerationJerkMagnitudeStdDev	
1. FreqBodyGyroMagnitudeMean	
1. FreqBodyGyroMagnitudeStdDev	
1. FreqBodyGyroJerkMagnitudeMean	
1. FreqBodyGyroJerkMagnitudeStdDev


Details about each of the field is given below:

* **activityId**: an integer between 1 to 6 indicating the activity. For mappings see activityLabel
* **subjectId**:  subject id who participated in the experiment
* **activityLabel**: activity description for each of the activityId. Following is the mapping between activityId & activityName

|**activityId** | **activityName** |
| -----------:|:--------------   | 
|1            | WALKING |
|2            | WALKING_UPSTAIRS |
|3            | WALKING_DOWNSTAIRS |
|4            | SITTING |
|5            | STANDING |
|6            | LAYING |

Rest of the fields are self-explanatory based on the name of the field. However the result file contains the mean of each of these fields

