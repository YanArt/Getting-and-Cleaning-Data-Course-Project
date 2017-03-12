---
title: "Readme"
author: "Yanchenko Artem"
date: "March 12, 2017"
output: html_document
---
keep_md: yes
---
    
## Project Description
Peer graded assignment Week 4, "Getting and cleaning data" course, "Data science" specialisation, Coursera

## Study design and data processing
The task is to create one R script called run_analysis.R that does the following:
    
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set. 
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## The script in run_analysis.R file does the following:

1. load "dplyr" package
2. download and unzip data set
3. create file paths and names lists so they could be referenced directly
4. create "test" data set from files in test subfolder with cbind()
    - test subjects identifier from "subject_test.txt"
    - activities identifier from "y_test.txt"
    - test measurements from "x_test.txt"
5. create "train" data set from files in train subfolder with cbind()
    - train subjects identifier from "subject_train.txt"
    - activities identifier from "y_train.txt"
    - train measurements from "x_train.txt"
6. merge "test" and "train" data sets into "full" data set with rbind()
7. extract variables names from original data set ("features.txt") and assign them to columns
8. subset only named variables into "short" data set
9. subset only identifiers and variables that contain "mean" or "std" in their names into "final" data set
10. change numeric activity labels to character descriptions from "activity_labels.txt""
11. group "final" data set by identifier variables "subject" and "activity_label"
12. summarise every group by applying mean function
13. change column names to reflect that they are now average of former variables
14. write the final tidy data set to a csv file in the working directory
14. clean up by removing everything created by the script, except for final tidy data set 

