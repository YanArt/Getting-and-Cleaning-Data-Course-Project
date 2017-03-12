---
title: "Codebook"
author: "Yanchenko Artem"
date: "March 12, 2017"
output: html_document
---
keep_md: yes
---

## Project Description
Peer graded assignment Week 4, "Getting and cleaning data" course, "Data science" specialisation, Coursera

##Study design and data processing
The task is to create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set. 
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

###Collection of the raw data
The data set for the project was downloaded from here:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectles%2FUCI%20HAR%20Dataset.zip>

###Notes on the original (raw) data 
The original data set was provided in zipped file.
Within this archive data were stored in .txt files.
The data set description is available here:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

##Creating the tidy datafile

###Guide to create the tidy data file
To create the tidy data file the following steps were taken:

1. download the data
2. unzip to working directory
3. read .txt files into two data sets "Test" and "Train", according to subdirectories files are placed in
4. merge the "Test" and "Train" data sets into full data set
5. extract variables names from "features.txt""
6. assign variables names taken from "features.txt" to columns in the full data set (as instructed)
7. subset named columns into short data set
8. subset columns with identifiers and "mean" and "std" variables (as instructed) into final data set
9. change nimeric activities identifiers to descriptive names (as instructed) from activity_labels.txt 
10. group the final data set by "subject" and "activity_label" (as instructed)
11. summarise the final data set by applying mean function to every group (as instructed)
12. change column names to reflect that they are now means of former variables
13. write the final tidy data set to a csv file in the working directory
14. clean the enviroment

###Cleaning of the data
Variables were scattered in a number of txt files.
Forming a final tidy data set has required them to be put together and given descriptive names taken from separate files.
The final tidy data set has every observation in a separate row and every variable in a separate column.
[link to the readme document that describes the code in greater detail]("Readme.md")

##Description of the variables in the Tidy_dataset.csv file
General description of the file including:

 - Dimensions of the dataset: 180 Rows and 81 Columns
 - Summary of the data:
 The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
 These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.
 Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Variable name | Description
---------------------- | -------------------------------------------------------------------------------------------
subject | Test subject ID, factor variable, range from 1 to 30
activity_lable | Label of performed activity, factor variable with levels:"Laying", "Sitting", "Standing", "Walking", "Walking_downstairs", "Walking_upstairs")

The following numeric variables are included in the data set:
tBodyAcc-mean()-X, tBodyAcc-mean()-Y, tBodyAcc-mean()-Z, tBodyAcc-std()-X, tBodyAcc-std()-Y, tBodyAcc-std()-Z, tGravityAcc-mean()-X, tGravityAcc-mean()-Y, tGravityAcc-mean()-Z, tGravityAcc-std()-X, tGravityAcc-std()-Y,
tGravityAcc-std()-Z, tBodyAccJerk-mean()-X, tBodyAccJerk-mean()-Y, tBodyAccJerk-mean()-Z, tBodyAccJerk-std()-X, tBodyAccJerk-std()-Y, tBodyAccJerk-std()-Z, tBodyGyro-mean()-X, tBodyGyro-mean()-Y, tBodyGyro-mean()-Z, tBodyGyro-std()-X, tBodyGyro-std()-Y, tBodyGyro-std()-Z, tBodyGyroJerk-mean()-X, tBodyGyroJerk-mean()-Y, tBodyGyroJerk-mean()-Z, 
tBodyGyroJerk-std()-X, tBodyGyroJerk-std()-Y,tBodyGyroJerk-std()-Z, tBodyAccMag-mean(), tBodyAccMag-std(), tGravityAccMag-mean(), tGravityAccMag-std(), tBodyAccJerkMag-mean(),tBodyAccJerkMag-std(), tBodyGyroMag-mean(), tBodyGyroMag-std(), tBodyGyroJerkMag-mean(), tBodyGyroJerkMag-std(), fBodyAcc-mean()-X, fBodyAcc-mean()-Y, fBodyAcc-mean()-Z, fBodyAcc-std()-X, fBodyAcc-std()-Y, fBodyAcc-std()-Z,   fBodyAcc-meanFreq()-X, fBodyAcc-meanFreq()-Y, fBodyAcc-meanFreq()-Z, fBodyAccJerk-mean()-X, fBodyAccJerk-mean()-Y, fBodyAccJerk-mean()-Z, fBodyAccJerk-std()-X, fBodyAccJerk-std()-Y, fBodyAccJerk-std()-Z, fBodyAccJerk-meanFreq()-X, fBodyAccJerk-meanFreq()-Y, fBodyAccJerk-meanFreq()-Z, fBodyGyro-mean()-X, fBodyGyro-mean()-Y, fBodyGyro-mean()-Z, fBodyGyro-std()-X, fBodyGyro-std()-Y, fBodyGyro-std()-Z, fBodyGyro-meanFreq()-X, fBodyGyro-meanFreq()-Y, fBodyGyro-meanFreq()-Z, fBodyGyro-std()-X, fBodyGyro-std()-Y, fBodyGyro-std()-Z, fBodyAccMag-std(), fBodyAccMag-meanFreq(), fBodyBodyAccJerkMag-mean(), fBodyBodyAccJerkMag-std(), fBodyBodyAccJerkMag-meanFreq(), fBodyBodyGyroMag-mean(), fBodyBodyGyroMag-std(), fBodyBodyGyroMag-meanFreq(), fBodyBodyGyroJerkMag-mean(), fBodyBodyGyroJerkMag-std(), fBodyBodyGyroJerkMag-meanFreq(), angle(tBodyAccMean,gravity), angle(tBodyAccJerkMean), gravityMean), angle(tBodyGyroMean,gravityMean), angle(tBodyGyroJerkMean,gravityMean), angle(X,gravityMean), angle(Y,gravityMean), angle(Z,gravityMean)

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.
