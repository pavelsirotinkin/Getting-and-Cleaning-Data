### The task to bo done by script:
### You should create one R script called run_analysis.R that does the following. 
### Merges the training and the test sets to create one data set.
### Extracts only the measurements on the mean and standard deviation for each measurement. 
### Uses descriptive activity names to name the activities in the data set
### Appropriately labels the data set with descriptive variable names. 
### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Loading packages that we'll use
library("data.table")
library("reshape2")

### Read data for train files into data frames
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

### Read data for test files into data frames
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

### Read activity labels for "test" and "train" data frame
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

### Read column headers for "test" and "train" data frame
features <- read.table("./UCI HAR Dataset/features.txt")

### Renaming headers for "test" and "train" data frames using headers from "features.txt"
names(X_test) <- features$V2
names(X_train) <- features$V2

### Define indexes for extracting only the measurements on the mean and standard deviation for each measurement
ext_index_mean <- grepl("mean", features$V2)
ext_index_std <- grepl("std", features$V2)
ext_index <- ext_index_mean | ext_index_std

### Extracting only the measurements on the mean and standard deviation for each measurement
X_train <- X_train[, ext_index]
X_test <- X_test[, ext_index]

### Replacing numbers for activity labels in "test" data set
names(subject_test) <- "Subject"
y_test$V2 <- activity_labels$V2[y_test$V1]
names(y_test) <- c("Activity.ID", "Activity.Label")

### Replacing numbers for activity labels in "train" data set
names(subject_train) <- "Subject"
y_train$V2 <- activity_labels$V2[y_train$V1]
names(y_train) <- c("Activity.ID", "Activity.Label")

### Merge the data for "test" and "train", then both
bind_test <- cbind(as.data.table(subject_test), y_test, X_test)
bind_train <- cbind(as.data.table(subject_train), y_train, X_train)
bind_data <- rbind(bind_test, bind_train)

### Making labels and melting the data
labels_id <- c("Subject", "Activity.ID", "Activity.Label")
labels_data <- setdiff(colnames(bind_data), labels_id)
data <- melt(bind_data, id = labels_id, measure.vars = labels_data)

### Creating new tidy data set with the average of each variable for each activity and each subject
tidy <- dcast(data, Subject + Activity.Label ~ variable, mean)

### Write data into the file
write.table(tidy, file = "./tidy.txt",  row.name=FALSE)