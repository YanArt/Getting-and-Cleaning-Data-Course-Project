## load "dplyr" package
library(dplyr)

## download and unzip data set
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl, destfile = "Dataset.zip")

unzip("Dataset.zip")

## create file paths and names lists so they could be referenced directly
files_all <- unzip("Dataset.zip",list=TRUE)

files_to_read <- files_all$Name[-c(5, 6, 19, 20)]

test_files <- files_to_read[grep("test", files_to_read)]

test_files_rearranged <- test_files[c(10, 12, 11, 1:9)]

train_files <- files_to_read[grep("train", files_to_read)]

train_files_rearranged <- train_files[c(10, 12, 11, 1:9)]

left_files <- files_to_read[!files_to_read %in% c(test_files, train_files)]

## create "test" data set from files in test subfolder
test_full <- data.frame(matrix(, nrow=2947, ncol=0))

for (i in 1:length(test_files_rearranged)) {
    test_full <- cbind(test_full, read.table(test_files_rearranged[i], header = FALSE))
    }

## create "train" data set from files in train subfolder
train_full <- data.frame(matrix(, nrow=7352, ncol=0))

for (i in 1:length(train_files_rearranged)) {
    train_full <- cbind(train_full, read.table(train_files_rearranged[i], header = FALSE))
}

## merge "test" and "train" data sets into "full" data set
dataset_full <- rbind(test_full, train_full)

## extract variables names from original data set and assign them to columns
variables_561_temp <- scan(left_files[2], what = character())

variables_561 <- as.vector(variables_561_temp[seq(2, length(variables_561_temp), 2)])

variables_fin <- c("subject", "activity_label", variables_561)

variables_fin <- gsub(" ", "", variables_fin)

colnames(dataset_full)[1:563] <- variables_fin

## subset only named variables into "short" data set
dataset_short <- dataset_full[, 1:563]

## subset only identifiers and variables that contain "mean" or "std" in their names into "final" data set
dataset_fin <- dataset_short[ , grepl("subject|label|mean|std", colnames(dataset_short))]

## change numeric activity labels to character descriptions from activity_labels.txt
actvts_names <- as.factor(scan(left_files[1], what = character())[seq(2, 12, 2)])

for (i in 1:length(actvts_names)) {
    x <- i
    dataset_fin$activity_label  <- gsub(x, actvts_names[i], dataset_fin$activity_label)
}

## group "final" data set by identifier variables "subject" and "activity_label"
grouped <- group_by(tbl_df(dataset_fin), subject, activity_label)

## summarise every group by applying mean function
fnl_ds_sum <- summarise_all(grouped, mean)

## change column names to reflect that they are now average of former variables
colnames(fnl_ds_sum)[3:81] <- gsub(" ", "", paste("mean_of_", colnames(fnl_ds_sum[3:81])))

write.table(fnl_ds_sum, file = "Tidy_dataset.txt", row.name=FALSE)

## clean up
clean <- ls()
clean <- clean [-7]
rm(list = clean)
rm(clean)