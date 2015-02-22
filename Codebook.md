# Getting-and-Cleaning-Data
Project for Coursera "Getting and Cleaning Data" course

The goal is to prepare tidy data that can be used for later analysis. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## R script called run_analysis.R should do the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## What should be done before running script
1. Download source files and put them into your R working directory (folder "UCI HAR Dataset");;
2. Script file "run_analysis.R" should be in your R working directory;
3. Run script file. It will create "tidy.txt" in your R working directory

## What a script does:
1. Loads two packages ("data.table", "reshape") in library;
2. Reads "train" and "test" files into data tables;
3. Reads the activity labels and features to be used as descriptive column headers;
4. Extracts only mean and standard deviation data from data sets;
4. Binds test and train data together;
5. Creates new tidy data set for the average of each variable for each activity and each subject
